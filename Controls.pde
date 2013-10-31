void keyPressed() {
  if (key=='z' || key=='Z') reverseZ = !reverseZ;
  if (key=='d' || key=='D'){
    if(!debug && debugDisplayMidi){ //if debug was turned off, show OSC screen first
      debug = true;
      debugDisplayMidi = false;
    }else if(debug && !debugDisplayMidi){ //if already showing the OSC screen, switch to MIDI screen
      debugDisplayMidi = true;
    }else{
      debugDisplayMidi = false;
      debug = !debug;
    }
  }
  if (key=='t' || key=='T') showTraces = !showTraces;
  if (key=='m' || key=='M'){
    sendMidi = !sendMidi;
    if(sendMidi) debugDisplayMidi = true;
  }
  if (key=='o' || key=='O'){
    sendOsc = !sendOsc;
    if(sendOsc) debugDisplayMidi = false;
  }
  if (key=='f' || key=='F') openAppFolderHandler();
  
  if(key=='r' || key=='R' || keyCode==33 || keyCode==34){
    record = !record;
    firstRun = false;
    if(!record) openAppFolderHandler();
  }
}

void openAppFolderHandler(){
  if(System.getProperty("os.name").equals("Mac OS X")){
    try{
      print("Trying OS X Finder method.");
      //open(sketchPath(""));
      //String[] params = {  };
      open(sketchPath("data"));
      open(sketchPath("ManosOsc.app/Contents/Resources/Java/data"));
      open(sketchPath("ManosOsc_LM.app/Contents/Resources/Java/data"));
    }catch(Exception e){ }
  }else{
    try{
      print("Trying Windows Explorer method.");
      Desktop.getDesktop().open(new File(sketchPath("") + "/data"));
    }catch(Exception e){ }
  }
}


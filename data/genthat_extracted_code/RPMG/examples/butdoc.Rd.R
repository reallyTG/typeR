library(RPMG)


### Name: butdoc
### Title: Button Documentation for RPMG codes
### Aliases: butdoc
### Keywords: misc

### ** Examples


 ALLLABS = c( "DONE","REFRESH","EPS","LINE","DECIM","MAP","SURF","TRACE","TTC","CITY","TRcol",
     "STName","Pick","ZOOM","UNZOOM","IDARR","FILT","UnFILT","P-GEN")
  N = length(ALLLABS)
    DOC = rep(NA, length=N)
    
  

DOC[1] = "Quick and return to calling program"
DOC[2] = "refresh screen"
DOC[3] = "Postscript plot"
DOC[4] = "draw a line (even number of clicks)"
DOC[5] = "Decimate the traces"
DOC[6] = "Make a map with great circles"
DOC[7] = "Draw a set of surface wave arrivals"
DOC[8] = "Toggle drawing of traces"
DOC[9] = "Travel Time Curves"
DOC[10] = "put random cities on X-axis"
DOC[11] = "toggle plotting traces with colors"
DOC[12] = "put station names on X-axis"
DOC[13] = "Pick arrivals on one trace"
DOC[14] = "Zoom display (need two clicks on screen)"
DOC[15] = "unzoom to original display"
DOC[16] = "Identify traces"
DOC[17] = "Fitler traces with a set of filters provided"
DOC[18] = "Unfilter traces to original display"
DOC[19] = "Run PICK.GEN on selected traces: select on the tags at X-axis"

  butdoc(ALLLABS, DOC,  NEW=FALSE)






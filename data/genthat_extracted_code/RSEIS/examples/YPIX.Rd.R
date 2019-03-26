library(RSEIS)


### Name: YPIX
### Title: PICK Buttons for swig
### Aliases: YPIX WPIX NOPIX REPIX PickWin pADDPIX Ppic Spic Apic POLSWITCH
###   Pup Pnil Pdown FILLPIX RIDPIX SEEPIX ROT.RT JustV JustE JustN iNEXT
###   noPS
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D MYFUNC<-function(nh, g)
##D   {
##D     print("pressed MYFUNC")
##D     d  <-  data.frame(list(stations=nh$STNS, components=nh$COMPS))
##D print(d)        
##D     g$action  <-  "replot"
##D     invisible(list(global.vars=g))	
##D   }
##D 
##D STDLAB <- c("DONE", "QUIT", "SELBUT" , "MYFUNC" )
##D data(GH)
##D JJ  <-  swig(GH, sel=1:10, STDLAB=STDLAB)
##D 
## End(Not run)






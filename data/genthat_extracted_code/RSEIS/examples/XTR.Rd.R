library(RSEIS)


### Name: XTR
### Title: Buttons for swig
### Aliases: XTR NEXT PREV HALF MARK DOC REFRESH RESTORE ZOOM.out ZOOM.in
###   LEFT RIGHT SCALE PSEL FLIP PTS FILT UNFILT SPEC WWIN SGRAM WLET XTR
###   Pinfo TSHIFT RMS LocStyle CENTER fspread Xwin
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D MYFUNC<-function(nh, g)
##D   {
##D     print("pressed MYFUNC")
##D     g$sel
##D     d  <-  data.frame(list(stations=nh$STNS[g$sel],
##D                    components=nh$COMPS[g$sel]))
##D      print(d)        
##D     g$action  <-  "replot"
##D     invisible(list(global.vars=g))	
##D   }
##D 
##D STDLAB <- c("DONE", "QUIT", "SELBUT" , "PSEL", "MYFUNC" )
##D data(GH)
##D JJ  <-  swig(GH, sel=1:10, STDLAB=STDLAB)
##D 
## End(Not run)






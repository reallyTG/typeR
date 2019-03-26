library(gWidgets)


### Name: gwindow
### Title: Constructor for base container
### Aliases: gwindow
### Keywords: interface

### ** Examples

## Not run: 
##D   ## window with handler
##D   win <- gwindow("Window example",
##D     handler=function(h,...) {
##D      print("See ya")
##D   })
##D   gbutton("cancel", container=win,
##D     handler = function(h,...) dispose(win))
##D 
##D   ## block closing of window
##D   win <- gwindow("Window example")
##D   addHandlerUnrealize(win, handler = function(h,...) {
##D     val <- gconfirm("Really close window", parent=h$obj)
##D     if(as.logical(val))
##D       return(FALSE)		# destroy
##D     else
##D       return(TRUE)		# don't destroy
##D   })
##D 
##D   
##D 
##D   ## transient dialog (gWidgetsRGtk2)
##D   pwin <- gwindow("Parent window")
##D   cwin <- gwindow("Child window", parent = pwin)
##D   ## clicking button close parent causing child to close too
##D   gbutton("close both", container=cwin,
##D     handler = function(h,...) dispose(pwin))
## End(Not run)




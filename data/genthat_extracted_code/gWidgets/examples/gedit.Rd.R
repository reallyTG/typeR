library(gWidgets)


### Name: gedit
### Title: Constructor for widget to handle single-line text input
### Aliases: gedit
### Keywords: interface

### ** Examples

## Not run: 
##D 	gedit("type here", container=gwindow())
##D 	
##D 	## change handler
##D 	obj <- gedit(container=gwindow())
##D 	addhandlerchanged(obj, handler=function(h,...) 
##D 	  cat("You typed", svalue(h$obj),"\n"))
##D 
##D 	 ## coerce to numeric
##D 	 obj <- gedit("7", container=gwindow(), coerce.with=as.numeric)
##D 	 svalue(obj)
##D 
## End(Not run)




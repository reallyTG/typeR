library(gWidgets)


### Name: gstatusbar
### Title: Constructor of status bar widget
### Aliases: gstatusbar
### Keywords: interface

### ** Examples

## Not run: 
##D   w <- gwindow("status bar example")
##D   tbl <- list(quit=list(icon="quit",
##D     handler = function(...) dispose(w)))
##D   tb <- gtoolbar(tbl, container=w)
##D   sb <- gstatusbar("", container=w)
##D   txt <- gtext("type here", container=w)
##D   addHandlerChanged(txt, handler=function(h,...)
##D     svalue(sb) <- paste("You typed",svalue(txt),"in the  box",collapse=" "))
##D 
## End(Not run)




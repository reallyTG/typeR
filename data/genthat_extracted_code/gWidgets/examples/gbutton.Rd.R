library(gWidgets)


### Name: gbutton
### Title: Button constructors
### Aliases: gbutton
### Keywords: interface

### ** Examples

## Not run: 
##D   ## button group example
##D   w <- gwindow("Button examples")
##D   g <- ggroup(container = w)
##D   addSpring(g)   ## push to right of widget
##D   gbutton("help", container = g)
##D   addSpace(g, 20) ## some breathing room
##D   gbutton("cancel", container = g)
##D   gbutton("ok", container = g, handler = function(h, ...) cat("do it\n"))
## End(Not run)




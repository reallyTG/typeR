library(gWidgets)


### Name: ghelp
### Title: Widget to interface with help pages
### Aliases: ghelp ghelpbrowser
### Keywords: interface

### ** Examples

## Not run: 
##D   w <- gwindow("Help browser", visible=FALSE)
##D   g <- ggroup(horizontal=FALSE, container=w)
##D   g1 <- ggroup(container=g)
##D   addSpring(g1)
##D   glabel("Help on:", container=g1)
##D   e <- gedit("", container=g1)
##D   helpWidget <- ghelp(container = g, expand=TRUE)
##D   addHandlerChanged(e, handler=function(h,...) {
##D      add(helpWidget, svalue(h$obj))
##D   })
##D   visible(w) <- TRUE
##D   ## add others
##D   add(helpWidget,"base:::mean")
##D   add(helpWidget, list(topic="mean", package="base"))
##D   add(helpWidget, "boxplot")
##D 
## End(Not run)




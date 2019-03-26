library(gWidgets2)


### Name: gframe
### Title: Constructor for framed box container with label
### Aliases: .gframe gframe

### ** Examples

## Not run: 
##D w <- gwindow("gformlayout", visible=FALSE)
##D f <- gframe("frame", horizontal=FALSE, container=w)
##D glabel("Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.", container=f)
##D gbutton("change name", container=f, handler=function(h,...) {
##D   names(f) <- "new name"
##D })
##D visible(w) <- TRUE
## End(Not run)




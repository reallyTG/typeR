library(gWidgets2)


### Name: gnotebook
### Title: Constructor for a tabbed notebook container
### Aliases: .gnotebook [.GNotebook add.GNotebook
###   addHandlerChanged.GNotebook dispose.GNotebook dispose.GStackWidget
###   gnotebook names.GNotebook svalue<-.GNotebook

### ** Examples

## Not run: 
##D 
##D w <- gwindow("notebook example", visible=FALSE)
##D nb <- gnotebook(container=w)
##D gbutton("Page one", label="tab 1", container=nb) ## note label argument
##D gbutton("Page two", label="tab 2", container=nb)
##D svalue(nb) <- 1
##D addHandlerChanged(nb, handler=function(h,...) {
##D   message(sprintf("On page %s", h$page.no)) ## svalue(h$obj) not always right
##D })
##D svalue(nb) <- 2 ## or use "Page two"
##D dispose(nb)
##D length(nb)
##D 
## End(Not run)




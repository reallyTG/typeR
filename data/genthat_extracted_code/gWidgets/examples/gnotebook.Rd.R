library(gWidgets)


### Name: gnotebook
### Title: constructor for notebook widget
### Aliases: gnotebook
### Keywords: interface

### ** Examples

## Not run: 
##D   w <- gwindow("gnotebook example")
##D   nb <- gnotebook(container=w)
##D   ## "add" called by constructor
##D   glabel("Widget 1", container=nb, label="page 1")  
##D   ## label argument passed by constructor to add method
##D   glabel("Widget 2", container=nb, label="page 2")   
##D 
##D   length(nb)
##D   names(nb)
##D   names(nb)[1] <- "Page 1"
##D 
##D   svalue(nb) <- 2
##D   dispose(nb) ## dispose current tab
##D   length(nb) 
## End(Not run)




library(gWidgets2)


### Name: gtable
### Title: A constructor for displaying tabular data for selection
### Aliases: .gtable [.GTable addHandlerChanged.GTable
###   addHandlerDoubleclick.GTable gtable size<-.GTable svalue.GTable
###   visible.GTable

### ** Examples

## Not run: 
##D w <- gwindow("gtable example", visible=FALSE)
##D g <- gvbox(cont=w)
##D tbl <- gtable(mtcars, cont=g, expand=TRUE, fill=TRUE)
##D addHandlerClicked(tbl, handler=function(h,...) sprintf("You selected %s", svalue(h$obj)))
##D visible(w) <- TRUE
##D 
## End(Not run)




library(gWidgets)


### Name: gcombobox
### Title: Widgets to allow selection from a vector of items
### Aliases: gcombobox gdroplist [<-,gCombobox-method
### Keywords: interface

### ** Examples

## Not run: 
##D   flavors <- c("vanilla", "chocolate", "strawberry")
##D 
##D   f <- function(h,...) print(
##D       paste("Yum",
##D       paste(svalue(h$obj),collapse=" and "),
##D       sep = " "))
##D 
##D   w <- gwindow("combobox example")
##D   gp <- ggroup(container=w)
##D   glabel("Favorite flavor:", container=gp)
##D   cb <- gcombobox(flavors, editable=TRUE, container=gp, handler=f)
##D 
##D   svalue(cb) <- "vanilla"
##D   svalue(cb)
##D   cbg[3] <- "raspberry"
##D 
## End(Not run)





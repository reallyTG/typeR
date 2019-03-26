library(gWidgets)


### Name: gcheckboxgroup
### Title: Widget to allow multiple selection from a vector of items
### Aliases: gcheckboxgroup
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
##D   w <- gwindow("checkbox example")
##D   gp <- ggroup(container=w)
##D   glabel("Favorite flavors:",container=gp)
##D   cbg <- gcheckboxgroup(flavors, container=gp, handler=f)
##D 
##D   svalue(cbg) <- c(TRUE, FALSE, TRUE)
##D   svalue(cbg)
##D   svalue(cbg) <- "vanilla"
##D   svalue(cbg, index=TRUE) <- 1:2
##D   cbg[3] <- "raspberry"
##D 
##D   ## use a table to display (toolkit specific) so that scrollars can be used
##D   cbg <- gcheckboxgroup(letters, container=gwindow(), use.table=TRUE)
##D 
## End(Not run)





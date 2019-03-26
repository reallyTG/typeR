library(gWidgets)


### Name: gradio
### Title: Radio button group widget
### Aliases: gradio [<-,gRadio-method
### Keywords: interface

### ** Examples

## Not run: 
##D 
##D   flavors <- c("vanilla", "chocolate", "strawberry")
##D 
##D   w <- gwindow("Radio example", visible=FALSE)
##D   gp <- ggroup(container=w)
##D   glabel("Favorite flavor:",container=gp, anchor=c(0,1))
##D   rb <- gradio(flavors, container=gp)
##D   addHandlerClicked(rb, handler=function(h,..) {
##D    cat(sprintf("You picked %s\n", svalue(h$obj)))
##D   })
##D   visible(w) <- TRUE
##D   
##D   betterFlavors <- c("coffee", "mint chip")
##D   rb[] <- betterFlavors 
##D   rb[] <- c(betterFlavors, "chocolate") # some toolkits don't allow change of length
##D   
##D   rb[3] <- "mango sorbet" ## can change a label name
##D 
##D   ## set values
##D   svalue(rb) <- "coffee"  ## by name
##D   svalue(rb, index=TRUE) <- 1  ## by index
##D 
##D   ## get selected values
##D   svalue(rb)
##D   svalue(rb, index=TRUE)
##D 
## End(Not run)





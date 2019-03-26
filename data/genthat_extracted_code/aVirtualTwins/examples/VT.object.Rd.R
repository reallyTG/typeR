library(aVirtualTwins)


### Name: VT.object
### Title: VT.object
### Aliases: VT.object

### ** Examples

## Not run: 
##D # Default use :
##D vt.o <- VT.object$new(data = my.rct.dataset)
##D 
##D # Getting data
##D head(vt.o$data)
##D 
##D # or getting predictor with interactions
##D vt.o$getX(interactions = T)
##D 
##D # or getting X|T = 1
##D vt.o$getX(trt = 1)
##D 
##D # or getting Y|T = 0
##D vt.o$getY(0)
##D 
##D # Print incidences
##D vt.o$getIncidences()
## End(Not run)





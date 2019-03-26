library(Rknots)


### Name: setCoordinates<--methods
### Title: Setters for the 'points3D' and 'ends' slots of a Knot object.
### Aliases: setCoordinates<--methods setCoordinates<-,Knot-method
###   setCoordinates setCoordinates<- [<--methods [<- [<-,Knot-method
###   setEnds<--methods setEnds<-,Knot-method setEnds setEnds<-
### Keywords: methods

### ** Examples

link <- makeExampleKnot(k = FALSE)
link <- newKnot(link$points3D, link$ends)

setCoordinates(link) <- matrix(runif(90), ncol = 3)
setEnds(link) <- c(10, 20)




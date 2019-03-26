library(Rknots)


### Name: plotDiagram
### Title: Plot a knot or a link diagram
### Aliases: plotDiagram
### Keywords: graphics

### ** Examples

## Not run: 
##D ##Represent 12 randomly selected link diagrams
##D par(mfrow = c(3,4))
##D 
##D for(i in 1 : 12) {
##D 	link <- makeExampleKnot( k = FALSE )
##D 	link <- AlexanderBriggs(link$points3D, link$ends)
##D 	plotDiagram(link$points3D, link$ends, main = i, lwd = 1.5)
##D }
## End(Not run)




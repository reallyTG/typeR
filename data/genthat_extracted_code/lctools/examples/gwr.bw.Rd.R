library(lctools)


### Name: gwr.bw
### Title: Optimal bandwidth estimation for Geographically Weighted
###   Regression (GWR)
### Aliases: gwr.bw
### Keywords: GWR optimal bandwidth

### ** Examples

RDF <- random.test.data(9,9,3,"normal")
bw <- gwr.bw(dep ~ X1 + X2, RDF, cbind(RDF$X,RDF$Y), kernel = 'adaptive', 
             b.min = 54, b.max=55)




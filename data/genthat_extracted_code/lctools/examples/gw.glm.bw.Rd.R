library(lctools)


### Name: gw.glm.bw
### Title: Optimal bandwidth estimation for Generalised Geographically
###   Weighted Regression (GGWR)
### Aliases: gw.glm.bw
### Keywords: GWR optimal bandwidth

### ** Examples

RDF <- random.test.data(12,12,3,"poisson")
gwpr.bw <-gw.glm.bw(dep ~ X1 + X2, "poisson", RDF, cbind(RDF$X,RDF$Y), 
                    kernel = 'adaptive', b.min = 48, b.max=50)




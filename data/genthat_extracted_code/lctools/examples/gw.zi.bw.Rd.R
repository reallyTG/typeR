library(lctools)


### Name: gw.zi.bw
### Title: Optimal bandwidth estimation for Geographically Weighted Zero
###   Inflated Poisson Regression (GWZIPR)
### Aliases: gw.zi.bw
### Keywords: GWR optimal bandwidth

### ** Examples

RDF <- random.test.data(9,9,3,"zip")
gw.zip.bw <- gw.zi.bw(dep ~ X1 + X2, "poisson", RDF, cbind(RDF$X,RDF$Y), 
                      kernel = 'adaptive', b.min = 54, b.max=55)




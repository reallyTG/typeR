library(lctools)


### Name: gw.glm
### Title: Generalised Geographically Weighted Regression (GGWR)
### Aliases: gw.glm
### Keywords: GWPR local regression

### ** Examples

RDF <- random.test.data(12,12,3,"poisson")
gwpr <- gw.glm(dep ~ X1 + X2, "poisson", RDF, 50, kernel = 'adaptive', cbind(RDF$X,RDF$Y))




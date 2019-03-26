library(lctools)


### Name: gw.zi
### Title: Geographically Weighted Zero Inflated Poisson Regression
###   (GWZIPR)
### Aliases: gw.zi
### Keywords: GWZIPR local regression

### ** Examples

RDF <- random.test.data(10,10,3,"zip")
gw.zip <- gw.zi(dep ~ X1 + X2, "poisson", RDF, 60, kernel = 'adaptive', cbind(RDF$X,RDF$Y))




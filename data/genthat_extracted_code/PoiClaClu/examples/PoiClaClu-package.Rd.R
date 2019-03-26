library(PoiClaClu)


### Name: PoiClaClu-package
### Title: Classification and clustering of RNA sequencing data using a
###   Poisson model
### Aliases: PoiClaClu-package PoiClaClu

### ** Examples

# Poisson clustering #
set.seed(1)
dat <- CountDataSet(n=20,p=100,sdsignal=.5,K=4,param=10)
dd <- PoissonDistance(dat$x, type="mle")
print(dd)
ColorDendrogram(hclust(dd$dd), y=dat$y)

# Poisson classification #
set.seed(1)
dat <- CountDataSet(n=20,p=100,sdsignal=.1,K=4,param=10)
out <- Classify(x=dat$x,y=dat$y,xte=dat$xte,rhos=c(0,5,10))
print(out)





library(PoiClaClu)


### Name: CountDataSet
### Title: Generate a simulated sequencing data set using a negative
###   binomial model.
### Aliases: CountDataSet

### ** Examples

set.seed(1)
dat <- CountDataSet(n=20,p=100,sdsignal=2,K=4,param=10)
dd <- PoissonDistance(dat$x,type="mle", transform=TRUE)




library(PoiClaClu)


### Name: PoissonDistance
### Title: Given a n-by-p data matrix, compute the corresponding n-by-n
###   Poisson dissimilarity matrix.
### Aliases: PoissonDistance

### ** Examples

set.seed(1)
dat <- CountDataSet(n=20,p=100,sdsignal=2,K=4,param=10)
dd <- PoissonDistance(dat$x,type="mle")
print(dd)
ColorDendrogram(hclust(dd$dd), y=dat$y, branchlength=10)




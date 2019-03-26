library(PoiClaClu)


### Name: ColorDendrogram
### Title: Color the leaves in a hierarchical clustering dendrogram
### Aliases: ColorDendrogram

### ** Examples

set.seed(1)
dat <- CountDataSet(n=20,p=100,sdsignal=2,K=4,param=10)
dd <- PoissonDistance(dat$x,type="mle")
ColorDendrogram(hclust(dd$dd), y=dat$y, branchlength=10)





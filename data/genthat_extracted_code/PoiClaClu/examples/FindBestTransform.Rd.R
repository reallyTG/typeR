library(PoiClaClu)


### Name: FindBestTransform
### Title: Find the power transformation that makes a data set
###   approximately Poisson.
### Aliases: FindBestTransform

### ** Examples

set.seed(1)
dat <- CountDataSet(n=20,p=100,sdsignal=2,K=4,param=10)
alpha <- FindBestTransform(dat$x)
# This is the best transformation!
dd <- PoissonDistance(dat$x^alpha,type="mle", transform=FALSE)
# OR we could get the samething automatically:
dd2 <- PoissonDistance(dat$x,type="mle",transform=TRUE)
# or like this:
dd3 <- PoissonDistance(dat$x,type="mle",transform=TRUE,alpha=alpha)
ColorDendrogram(hclust(dd$dd), y=dat$y, branchlength=10)




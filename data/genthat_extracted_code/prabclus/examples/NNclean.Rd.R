library(prabclus)


### Name: NNclean
### Title: Nearest neighbor based clutter/noise detection
### Aliases: NNclean print.nnclean
### Keywords: multivariate cluster

### ** Examples

library(mclust)
data(chevron)
nnc <-  NNclean(chevron[,2:3],15,plot=TRUE)
plot(chevron[,2:3],col=1+nnc$z)




library(spatstat)


### Name: nnclean
### Title: Nearest Neighbour Clutter Removal
### Aliases: nnclean nnclean.ppp nnclean.pp3
### Keywords: spatial classif

### ** Examples

  data(shapley)
  X <- nnclean(shapley, k=17, plothist=TRUE)
  plot(X, which.marks=1, chars=c(".", "+"), cols=1:2)
  plot(X, which.marks=2, cols=function(x)hsv(0.2+0.8*(1-x),1,1))
  Y <- split(X, un=TRUE)
  plot(Y, chars="+", cex=0.5)
  marks(X) <- marks(X)$prob
  plot(cut(X, breaks=3), chars=c(".", "+", "+"), cols=1:3)




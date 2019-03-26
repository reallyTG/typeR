library(spatstat)


### Name: sdr
### Title: Sufficient Dimension Reduction
### Aliases: sdr sdr.ppp
### Keywords: spatial multivariate

### ** Examples

   A <- sdr(bei, bei.extra, predict=TRUE)
   A
   Y1 <- A$Y[[1]]
   plot(Y1)
   points(bei, pch=".", cex=2)
   # investigate likely form of dependence
   plot(rhohat(bei, Y1))




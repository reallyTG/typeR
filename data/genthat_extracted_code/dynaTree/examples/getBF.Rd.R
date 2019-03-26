library(dynaTree)


### Name: getBF
### Title: Extract a Path of (log) Bayes Factors
### Aliases: getBF
### Keywords: htest

### ** Examples

## parabola data
n <- 100
Xp <- sort(runif(n,-3,3))
Yp <- Xp + Xp^2 + rnorm(n, 0, .2)
XXp <- seq(-3,3,length=100)

## comparison by log Bayes Factor
R <- 2 ## use R >= 10 for better results
## small R is for faster CRAN checks
o <- apply(matrix(runif(n*(R-1)), ncol=R-1), 2, order)
lpc.p <- dynaTrees(Xp, Yp, R=R, rorder=o, verb=0)
lpl.p <- dynaTrees(Xp, Yp, model="linear", R=R, rorder=o, verb=0)
bf.p <- getBF(lpl.p, lpc.p)

## plot the log Bayes factors
matplot(bf.p, type="l", lty=1, col="gray", main="parabola",
        xlab="time", ylab="log Bayes factor")

## see demo("reg1d") for further examples




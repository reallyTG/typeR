library(dynaTree)


### Name: sens.dynaTree
### Title: Monte Carlo Sensitivity Analysis for dynaTree Models
### Aliases: sens.dynaTree
### Keywords: methods htest

### ** Examples

## friedman data
library(tgp)
f <- friedman.1.data(1000)
X <- f[,1:6]
Z <- f$Y

## fit the model and do the sensitivity analysis
N <- 100 ## use N >= 1000 for better results
## small N is for fast CRAN checks
out <- dynaTree(X=X, y=Z, N=N, ab=c(0.01,2))
## also try with model="linear"

## gather relevance statistics
out <- relevance(out)
boxplot(out$relevance)
abline(h=0, col=2, lty=2)
## relevance stats are not as useful when model="linear"
## since it will appear that x4 and x5 not helpful; these
## interact linearly with the response

## full simulation-based sensitivity analysis, the dynaTree::
## part is only needed if the tgp package is loaded
out <- dynaTree::sens(out, verb=100)

## plot the main effects
r <- range(rbind(c(out$MEmean, out$MEq1, out$MEq2)))
par(mfrow=c(1,ncol(out$X)), mar=c(5,3,2,1))
plot(out$MEgrid[,1], out$MEmean[,1], type="l", ylim=r, lwd=2,
     ylab="", xlab=colnames(out$MEmean)[1])
lines(out$MEgrid[,1], out$MEq1[,1], lty=2, lwd=2)
lines(out$MEgrid[,1], out$MEq2[,1], lty=2, lwd=2)
if(ncol(out$X) > 1) {
  for(d in 2:ncol(out$X)) {
    plot(out$MEgrid[,d], out$MEmean[,d], col=d, type="l", ylim=r,
         lwd=2, xlab=colnames(out$MEmean)[d], ylab="")
    lines(out$MEgrid[,d], out$MEq1[,d], col=d, lty=2)
    lines(out$MEgrid[,d], out$MEq2[,d], col=d, lty=2)
  }
}

## Sobol indices
par(mfrow=c(1,2), mar=c(5,4,4,2))
boxplot(out$S, main="first order indices", xlab="inputs")
boxplot(out$T, main="total indices", xlab="inputs")
## these look better when model="linear"

## clean up
deletecloud(out)

## for a classification example using the sensitivity hooks
## in the dynaTrees function,  see the class2d demo
## i.e., demo("class2d")




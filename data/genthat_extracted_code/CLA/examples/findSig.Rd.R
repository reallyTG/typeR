library(CLA)


### Name: findSig
### Title: Find sigma(W) and W, given mu(W) and CLA result
### Aliases: findSig
### Keywords: arith dplot

### ** Examples

data(muS.sp500)
## Full data taking too much time for example: Subset of n=21:
set.seed(2018)
iS <- sample.int(length(muS.sp500$mu), 21)
cov21 <- muS.sp500$covar[iS, iS]
CLsp.21 <- CLA(muS.sp500$mu[iS], covar=cov21, lB=0, uB = 1/2)
CLsp.21 # 14 turning points
summary(tpM <- CLsp.21$MS_weights[,"Mu"])
str(m0 <- c(min(tpM),seq(0.00205, 0.00525, by = 0.00005), max(tpM)))
sig. <- findSig(m0, result=CLsp.21, covar=cov21)
str(sig.)
stopifnot(dim(sig.$weight) == c(21, length(m0)))
plot(sig.$Sig, m0, xlab=quote(sigma), ylab = quote(mu),
     type = "o", cex = 1/4)
points(CLsp.21$MS_weights, col = "tomato", cex = 1.5)
title("Efficient Frontier from CLA()")
mtext("findSig() to interpolate between turning points", side=3)




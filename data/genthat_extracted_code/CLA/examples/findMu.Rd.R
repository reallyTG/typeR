library(CLA)


### Name: findMu
### Title: Find mu(W) and W, given sigma(W) and CLA result
### Aliases: findMu
### Keywords: optimize arith

### ** Examples

data(muS.sp500)
## Full data taking too much time for example
set.seed(2016)
iS <- sample.int(length(muS.sp500$mu), 17)
cov17 <- muS.sp500$covar[iS, iS]
CLsp.17 <- CLA(muS.sp500$mu[iS], covar=cov17, lB=0, uB = 1/2)
CLsp.17 # 16 turning points
summary(tpS <- CLsp.17$MS_weights[,"Sig"])
str(s0 <- seq(0.0186, 0.0477, by = 0.0001))
mu.. <- findMu(s0, result=CLsp.17, covar=cov17)
str(mu..)
stopifnot(dim(mu..$weight) == c(17, length(s0)))
plot(s0, mu..$Mu, xlab=quote(sigma), ylab = quote(mu),
     type = "o", cex = 1/4)
points(CLsp.17$MS_weights, col = "tomato", cex = 1.5)




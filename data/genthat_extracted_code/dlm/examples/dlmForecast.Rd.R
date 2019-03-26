library(dlm)


### Name: dlmForecast
### Title: Prediction and simulation of future observations
### Aliases: dlmForecast
### Keywords: misc

### ** Examples

## Comparing theoretical prediction intervals with sample quantiles
set.seed(353)
n <- 20; m <- 1; p <- 5
mod <- dlmModPoly() + dlmModSeas(4, dV=0)
W(mod) <- rwishart(2*p,p) * 1e-1
m0(mod) <- rnorm(p, sd=5)
C0(mod) <- diag(p) * 1e-1
new <- 100
fore <- dlmForecast(mod, nAhead=n, sampleNew=new)
ciTheory <- (outer(sapply(fore$Q, FUN=function(x) sqrt(diag(x))), qnorm(c(0.1,0.9))) +
             as.vector(t(fore$f)))
ciSample <- t(apply(array(unlist(fore$newObs), dim=c(n,m,new))[,1,], 1,
                    FUN=function(x) quantile(x, c(0.1,0.9))))
plot.ts(cbind(ciTheory,fore$f[,1]),plot.type="s", col=c("red","red","green"),ylab="y")
for (j in 1:2) lines(ciSample[,j], col="blue")
legend(2,-40,legend=c("forecast mean", "theoretical bounds", "Monte Carlo bounds"),
       col=c("green","red","blue"), lty=1, bty="n")




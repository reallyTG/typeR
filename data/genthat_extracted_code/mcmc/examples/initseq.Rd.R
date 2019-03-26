library(mcmc)


### Name: initseq
### Title: Initial Sequence Estimators
### Aliases: initseq
### Keywords: ts

### ** Examples

n <- 2e4
rho <- 0.99
x <- arima.sim(model = list(ar = rho), n = n)
out <- initseq(x)
## Not run: 
##D plot(seq(along = out$Gamma.pos) - 1, out$Gamma.pos,
##D    xlab = "k", ylab = expression(Gamma[k]), type = "l")
##D lines(seq(along = out$Gamma.dec) - 1, out$Gamma.dec, col = "red")
##D lines(seq(along = out$Gamma.con) - 1, out$Gamma.con, col = "blue")
## End(Not run)
# asymptotic 95% confidence interval for mean of x
mean(x) + c(-1, 1) * qnorm(0.975) * sqrt(out$var.con / length(x))
# estimated asymptotic variance
out$var.con
# theoretical asymptotic variance
(1 + rho) / (1 - rho) * 1 / (1 - rho^2)
# illustrating use with batch means
bm <- apply(matrix(x, nrow = 5), 2, mean)
initseq(bm)$var.con * 5




library(tvReg)


### Name: tvOLS
### Title: Time-Varying Ordinary Least Squares
### Aliases: tvOLS

### ** Examples

tau <- seq(1:500)/500
beta <- data.frame(beta1 = sin(2*pi*tau), beta2= 2*tau)
X <- data.frame(X1 = rnorm(500), X2 = rchisq(500, df = 4))
error <- rt(500, df = 10)
y <- apply(X*beta, 1, sum) + error
coef.lm <- stats::lm(y~0+X1+X2, data = X)$coef
coef.tvlm <-  tvOLS(x = X, y = y, bw = 0.1)$tvcoef
plot(tau,beta[, 1], type="l", main="", ylab = expression(beta[1]), xlab = expression(tau),
ylim = range(beta[,1], coef.tvlm[, 1]))
abline(h = coef.lm[1], col = 2)
lines(tau, coef.tvlm[, 1], col = 4)
legend("topright", c(expression(beta[1]), "lm", "tvlm"), col = c(1, 2, 4), bty="n", lty = 1)





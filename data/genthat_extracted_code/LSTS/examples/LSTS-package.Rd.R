library(LSTS)


### Name: LSTS-package
### Title: LSTS Package
### Aliases: LSTS-package LSTS
### Keywords: package

### ** Examples

##########################################
########## Tree Ring Aplication ##########
##########################################

## Require: "rdatamarket"
library(rdatamarket)
malleco = dmlist("22tn")

y = malleco$Value
op = par(mfrow = c(1,2), cex = 0.9)
acf(y, lag = 10, ylim = c(-0.1,1), bty = "n", las = 1, main = "")
pacf(y, lag = 10, xlim = c(0,10), ylim = c(-0.1,1), bty = "n", las = 1, main = "")
par(op)
## AR(1) structure

y1 = y[1:250]
y2 = y[243:492]
y3 = y[485:734]
op = par(mfrow = c(2,3), cex = 0.9)
acf(y1, lag = 10, ylim = c(-0.1,1), bty = "n", las = 1, main = "block 1")
acf(y2, lag = 10, ylim = c(-0.1,1), bty = "n", las = 1, main = "block 2")
acf(y3, lag = 10, ylim = c(-0.1,1), bty = "n", las = 1, main = "block 3")
pacf(y1, lag = 10, xlim = c(0,10), ylim = c(-0.1,1), bty = "n", las = 1, main = "")
pacf(y2, lag = 10, xlim = c(0,10), ylim = c(-0.1,1), bty = "n", las = 1, main = "")
pacf(y3, lag = 10, xlim = c(0,10), ylim = c(-0.1,1), bty = "n", las = 1, main = "")
par(op)

block.smooth.periodogram(y, spar.freq = 0.8, spar.time = 0.8, theta = 90, phi = 0)

# Analysis by blocks of phi and sigma parameters
T. = length(y)
N = 200
S = 100
M = trunc((T. - N)/S + 1)
table = c()
for(j in 1:M){
x = y[(1 + S*(j-1)):(N + S*(j-1))]
table = rbind(table,nlminb(start = c(0.65, 0.15), N = N, objective = LS.whittle.loglik,
                           series = x, order = c(p = 1, q = 0))$par)
}
u = (N/2 + S*(1:M-1))/T.
table = as.data.frame(cbind(u, table))
colnames(table) = c("u", "phi", "sigma")

op = par(mfrow = c(1,2), cex = 0.8)
spar = 0.6
plot(smooth.spline(phi, spar = spar)$y ~ u, data = table, pch = 20, ylim = c(0,1),
     xlim = c(0,1), las = 1, bty = "n", ylab = expression(phi(u)))
plot(smooth.spline(sigma, spar = spar)$y ~ u, data = table, pch = 20, ylim = c(0,0.2),
     xlim = c(0,1), las = 1, bty = "n", ylab = expression(phi(u)))
par(op)

## start parameters
phi = smooth.spline(table$phi, spar = spar)$y
fit.1 = nls(phi ~ a0+a1*u, start = list(a0 = 0.65, a1 = 0.00))
sigma = smooth.spline(table$sigma, spar = spar)$y
fit.2 = nls(sigma ~ b0+b1*u, start = list(b0 = 0.65, b1 = 0.00))

fit = LS.whittle(series = y, start = c(coef(fit.1), coef(fit.2)), order = c(p = 1, q = 0),
                 ar.order = c(1), sd.order = 1, N = 180, n.ahead = 10)

## Summary
LS.summary(fit)

## Diagnostic
ts.diag(fit$residuals)

## Fitted Values
op = par(mfrow = c(1,2), cex = 0.8)
spar = 0.6
plot(smooth.spline(phi, spar = spar)$y ~ u, data = table, pch = 20, ylim = c(0,1),
     xlim = c(0,1), las = 1, bty = "n", ylab = expression(phi(u)))
lines(fit$coef[1]+fit$coef[2]*u~u)
plot(smooth.spline(sigma, spar = spar)$y ~ u, data = table, pch = 20, ylim = c(0,0.2),
     xlim = c(0,1), las = 1, bty = "n", ylab = expression(sigma(u)))
lines(fit$coef[3]+fit$coef[4]*u~u)
par(op)

plot(fit$series, type = "l")
lines(fit$fitted.values, col = "red", lty = 1)
for(alpha in seq(0.05,1.00, 0.01)){
lines(fit$pred + fit$se * qnorm(1-alpha/2), col = gray(1-alpha))
lines(fit$pred - fit$se * qnorm(1-alpha/2), col = gray(1-alpha))
}




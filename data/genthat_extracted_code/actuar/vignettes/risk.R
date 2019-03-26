### R code from vignette source 'risk.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: risk.Rnw:82-84
###################################################
library(actuar)
options(width = 52, digits = 4)


###################################################
### code chunk number 2: risk.Rnw:224-250
###################################################
fu <- discretize(plnorm(x), method = "upper", from = 0, to = 5)
fl <- discretize(plnorm(x), method = "lower", from = 0, to = 5)
fr <- discretize(plnorm(x), method = "rounding", from = 0, to = 5)
fb <- discretize(plnorm(x), method = "unbiased", from = 0, to = 5,
                 lev = levlnorm(x))
par(mfrow = c(2, 2), c(5, 2, 4, 2))
curve(plnorm(x), from = 0, to = 5, lwd = 2, main = "Upper", ylab = "F(x)")
plot(stepfun(0:4, diffinv(fu)), pch = 20, add = TRUE)
curve(plnorm(x), from = 0, to = 5, lwd = 2, main = "Lower", ylab = "F(x)")
plot(stepfun(0:5, diffinv(fl)), pch = 20, add = TRUE)
curve(plnorm(x), from = 0, to = 5, lwd = 2, main = "Rounding", ylab = "F(x)")
plot(stepfun(0:4, diffinv(fr)), pch = 20, add = TRUE)
curve(plnorm(x), from = 0, to = 5, lwd = 2, main = "Unbiased", ylab = "F(x)")
plot(stepfun(0:5, diffinv(fb)), pch = 20, add = TRUE)
## curve(plnorm(x), from = 0, to = 5, lwd = 2, ylab = "F(x)")
## par(col = "blue")
## plot(stepfun(0:4, diffinv(fu)), pch = 19, add = TRUE)
## par(col = "red")
## plot(stepfun(0:5, diffinv(fl)), pch = 19, add = TRUE)
## par(col = "green")
## plot(stepfun(0:4, diffinv(fr)), pch = 19, add = TRUE)
## par(col = "magenta")
## plot(stepfun(0:5, diffinv(fb)), pch = 19, add = TRUE)
## legend(3, 0.3, legend = c("upper", "lower", "rounding", "unbiased"),
##        col = c("blue", "red", "green", "magenta"), lty = 1, pch = 19,
##        text.col = "black")


###################################################
### code chunk number 3: risk.Rnw:264-269 (eval = FALSE)
###################################################
## fx <- discretize(pgamma(x, 2, 1), method = "upper",
##                  from = 0, to = 17, step = 0.5)
## fx <- discretize(pgamma(x, 2, 1), method = "unbiased",
##                  lev = levgamma(x, 2, 1),
##                  from = 0, to = 17, step = 0.5)


###################################################
### code chunk number 4: risk.Rnw:389-395
###################################################
fx <- discretize(pgamma(x, 2, 1), method = "unbiased",
                 from = 0, to = 22, step = 0.5,
                 lev = levgamma(x, 2, 1))
Fs <- aggregateDist("recursive", model.freq = "poisson",
                    model.sev = fx, lambda = 10, x.scale = 0.5)
summary(Fs)                           # summary method


###################################################
### code chunk number 5: risk.Rnw:399-403
###################################################
Fsc <- aggregateDist("recursive", model.freq = "poisson",
                     model.sev = fx, lambda = 5, convolve = 1,
                     x.scale = 0.5)
summary(Fsc)                           # summary method


###################################################
### code chunk number 6: risk.Rnw:407-408
###################################################
knots(Fs)                      # support of Fs.b (knots)


###################################################
### code chunk number 7: risk.Rnw:412-413 (eval = FALSE)
###################################################
## plot(Fs, do.points = FALSE, verticals = TRUE, xlim = c(0, 60))


###################################################
### code chunk number 8: risk.Rnw:417-418
###################################################
plot(Fs, do.points = FALSE, verticals = TRUE, xlim = c(0, 60))


###################################################
### code chunk number 9: risk.Rnw:429-432
###################################################
mean(Fs)                              # empirical mean
quantile(Fs)                          # quantiles
quantile(Fs, 0.999)                   # quantiles


###################################################
### code chunk number 10: risk.Rnw:437-438
###################################################
diff(Fs)


###################################################
### code chunk number 11: risk.Rnw:460-462
###################################################
VaR(Fs)
CTE(Fs)


###################################################
### code chunk number 12: risk.Rnw:470-496
###################################################
fx.u <- discretize(pgamma(x, 2, 1), from = 0, to = 22, step = 0.5,
                   method = "upper")
Fs.u <- aggregateDist("recursive", model.freq = "poisson",
                      model.sev = fx.u, lambda = 10, x.scale = 0.5)
fx.l <- discretize(pgamma(x, 2, 1), from = 0, to = 22, step = 0.5,
                   method = "lower")
Fs.l <- aggregateDist("recursive", model.freq = "poisson",
                      model.sev = fx.l, lambda = 10, x.scale = 0.5)
Fs.n <- aggregateDist("normal", moments = c(20, 60))
Fs.s <- aggregateDist("simulation",
                      model.freq = expression(y = rpois(10)),
                      model.sev = expression(y = rgamma(2, 1)),
                      nb.simul = 10000)
par(col = "black")
plot(Fs, do.points = FALSE, verticals = TRUE, xlim = c(0, 60), sub = "")
par(col = "blue")
plot(Fs.u, do.points = FALSE, verticals = TRUE, add = TRUE, sub = "")
par(col = "red")
plot(Fs.l, do.points = FALSE, verticals = TRUE, add = TRUE, sub = "")
par(col = "green")
plot(Fs.s, do.points = FALSE, verticals = TRUE, add = TRUE, sub = "")
par(col = "magenta")
plot(Fs.n, add = TRUE, sub = "")
legend(30, 0.4, c("recursive + unbiased", "recursive + upper", "recursive + lower", "simulation", "normal approximation"),
       col = c("black", "blue", "red", "green", "magenta"),
       lty = 1, text.col = "black")


###################################################
### code chunk number 13: risk.Rnw:587-589
###################################################
adjCoef(mgf.claim = mgfexp(x), mgf.wait = mgfexp(x, 2),
        premium.rate = 2.4, upper = 1)


###################################################
### code chunk number 14: risk.Rnw:619-625
###################################################
mgfx <- function(x, y) mgfexp(x * y)
p <- function(x) 2.6 * x - 0.2
rho <- adjCoef(mgfx, mgfexp(x, 2), premium = p, upper = 1,
               reins = "prop", from = 0, to = 1)
rho(c(0.75, 0.8, 0.9, 1))
plot(rho)


###################################################
### code chunk number 15: risk.Rnw:630-631
###################################################
plot(rho)


###################################################
### code chunk number 16: risk.Rnw:731-735
###################################################
psi <- ruin(claims = "e", par.claims = list(rate = 5),
            wait   = "e", par.wait   = list(rate = 3))
psi
psi(0:10)


###################################################
### code chunk number 17: risk.Rnw:740-741
###################################################
op <- options(width=50)


###################################################
### code chunk number 18: risk.Rnw:743-747
###################################################
ruin(claims = "e",
     par.claims = list(rate = c(3, 7), weights = 0.5),
     wait = "e",
     par.wait = list(rate = 3))


###################################################
### code chunk number 19: risk.Rnw:753-759
###################################################
prob <- c(0.5614, 0.4386)
rates <- matrix(c(-8.64, 0.101, 1.997, -1.095), 2, 2)
ruin(claims = "p",
     par.claims = list(prob = prob, rates = rates),
     wait = "e",
     par.wait = list(rate = c(5, 1), weights = c(0.4, 0.6)))


###################################################
### code chunk number 20: risk.Rnw:765-771
###################################################
psi <- ruin(claims = "p",
            par.claims = list(prob = prob, rates = rates),
            wait = "e",
            par.wait = list(rate = c(5, 1),
                            weights = c(0.4, 0.6)))
plot(psi, from = 0, to = 50)


###################################################
### code chunk number 21: risk.Rnw:773-774
###################################################
options(op)


###################################################
### code chunk number 22: risk.Rnw:779-780
###################################################
plot(psi, from = 0, to = 50)


###################################################
### code chunk number 23: risk.Rnw:849-859
###################################################
f.L <- discretize(ppareto(x, 4, 4), from = 0, to = 200,
                  step = 1, method = "lower")
f.U <- discretize(ppareto(x, 4, 4), from = 0, to = 200,
                  step = 1, method = "upper")
F.L <- aggregateDist(method = "recursive",
                     model.freq = "geometric",
                     model.sev = f.L, prob = 1/6)
F.U <- aggregateDist(method = "recursive",
                     model.freq = "geometric",
                     model.sev = f.U, prob = 1/6)


###################################################
### code chunk number 24: risk.Rnw:865-871
###################################################
psi.L <- function(u) 1 - F.U(u)
psi.U <- function(u) 1 - F.L(u)
u <- seq(0, 50, by = 5)
cbind(lower = psi.L(u), upper = psi.U(u))
curve(psi.L, from = 0, to = 100, col = "blue")
curve(psi.U, add = TRUE, col = "green")


###################################################
### code chunk number 25: risk.Rnw:876-878
###################################################
curve(psi.L, from = 0, to = 100, col = "blue")
curve(psi.U, add = TRUE, col = "green")



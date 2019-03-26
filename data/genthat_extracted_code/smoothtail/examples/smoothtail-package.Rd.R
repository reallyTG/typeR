library(smoothtail)


### Name: smoothtail-package
### Title: Smooth Estimation of GPD Shape Parameter
### Aliases: smoothtail-package smoothtail 'tail index' logcon logcondens
### Keywords: distribution htest nonparametric

### ** Examples

# generate ordered random sample from GPD
set.seed(1977)
n <- 20
gam <- -0.75
x <- rgpd(n, gam)

# compute known endpoint
omega <- -1 / gam

# estimate log-concave density, i.e. generate dlc object
est <- logConDens(x, smoothed = FALSE, print = FALSE, gam = NULL, xs = NULL)

# plot distribution functions
s <- seq(0.01, max(x), by = 0.01)
plot(0, 0, type = 'n', ylim = c(0, 1), xlim = range(c(x, s))); rug(x)
lines(s, pgpd(s, gam), type = 'l', col = 2)
lines(x, 1:n / n, type = 's', col = 3)
lines(x, est$Fhat, type = 'l', col = 4)
legend(1, 0.4, c('true', 'empirical', 'estimated'), col = c(2 : 4), lty = 1)

# compute tail index estimators for all sensible indices k
falk.logcon <- falk(est)
falkMVUE.logcon <- falkMVUE(est, omega)
pick.logcon <- pickands(est)
genPick.logcon <- generalizedPick(est, c = 0.75, gam0 = -1/3)

# plot smoothed and unsmoothed estimators versus number of order statistics
plot(0, 0, type = 'n', xlim = c(0,n), ylim = c(-1, 0.2))
lines(1:n, pick.logcon[, 2], col = 1); lines(1:n, pick.logcon[, 3], col = 1, lty = 2)
lines(1:n, falk.logcon[, 2], col = 2); lines(1:n, falk.logcon[, 3], col = 2, lty = 2)
lines(1:n, falkMVUE.logcon[,2], col = 3); lines(1:n, falkMVUE.logcon[,3], col = 3, 
    lty = 2)
lines(1:n, genPick.logcon[, 2], col = 4); lines(1:n, genPick.logcon[, 3], col = 4, 
    lty = 2)
abline(h = gam, lty = 3)
legend(11, 0.2, c("Pickands", "Falk", "Falk MVUE", "Generalized Pickands'"), 
    lty = 1, col = 1:8)




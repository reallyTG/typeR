
library("mlt")
library("sandwich")

chk <- function(x, y) stopifnot(all.equal(x, y, tol = 1e-4))
set.seed(29)

n <- 100
d <- data.frame(y = rnorm(n))
mod <- ctm(as.basis(~ y, data = d))
off <- runif(n)
fmod <- mlt(mod, data = d, offset = off)
sub <- sample(1:n, n/2, replace = FALSE)

w <- rep(1, n)
ms1 <- update(fmod, weights = w, subset = sub)
ms2 <- mlt(mod, data = d[sub,,drop = FALSE], offset = off[sub])
chk(coef(ms1), coef(ms2))
chk(estfun(ms1), estfun(ms2))
chk(vcov(ms1), vcov(ms2))
chk(logLik(ms1), logLik(ms2))

w <- runif(n)
ms1 <- update(fmod, weights = w, subset = sub)
ms2 <- mlt(mod, data = d[sub,,drop = FALSE],
           weights = w[sub], offset = off[sub])
chk(coef(ms1), coef(ms2))
chk(estfun(ms1), estfun(ms2))
chk(vcov(ms1), vcov(ms2))
chk(logLik(ms1), logLik(ms2))


y <- rnorm(n)
d <- data.frame(x = runif(n))
d$y <- R(cleft = y - .1, cright = y + .1)
fmod <- mlt(mod, data = d, offset = off)
sub <- sample(1:n, n/2, replace = FALSE)

w <- rep(1, n)
ms1 <- update(fmod, weights = w, subset = sub)
ms2 <- mlt(mod, data = d[sub,,drop = FALSE], offset = off[sub])
chk(coef(ms1), coef(ms2))
chk(estfun(ms1), estfun(ms2))
chk(vcov(ms1), vcov(ms2))
chk(logLik(ms1), logLik(ms2))

w <- runif(n)
ms1 <- update(fmod, weights = w, subset = sub)
ms2 <- mlt(mod, data = d[sub,,drop = FALSE],
           weights = w[sub], offset = off[sub] )
chk(coef(ms1), coef(ms2))
chk(estfun(ms1), estfun(ms2))
chk(vcov(ms1), vcov(ms2))
chk(logLik(ms1), logLik(ms2))

ex <- sample(1:n, n/2, replace = TRUE)
ye <- yi <- y
ye[-ex] <- NA
yi[ex] <- NA
d$y <- R(ye, cleft = yi - .1, cright = yi + .1)
fmod <- mlt(mod, data = d, offset = off)
sub <- sample(1:n, n/2, replace = FALSE)

w <- rep(1, n)
ms1 <- update(fmod, weights = w, subset = sub)
ms2 <- mlt(mod, data = d[sub,,drop = FALSE], offset = off[sub])
chk(coef(ms1), coef(ms2))
chk(estfun(ms1), estfun(ms2))
chk(vcov(ms1), vcov(ms2))
chk(logLik(ms1), logLik(ms2))

w <- runif(n)
ms1 <- update(fmod, weights = w, subset = sub)
ms2 <- mlt(mod, data = d[sub,,drop = FALSE],
           weights = w[sub], offset = off[sub] )
chk(coef(ms1), coef(ms2))
chk(estfun(ms1), estfun(ms2))
chk(vcov(ms1), vcov(ms2))
chk(logLik(ms1), logLik(ms2))

d$y <- R(ye, cleft = yi - .1, cright = yi + .1, tleft = y - 2, tright = y + 2)
fmod <- mlt(mod, data = d, offset = off)
sub <- sample(1:n, n/2, replace = FALSE)

w <- rep(1, n)
ms1 <- update(fmod, weights = w, subset = sub)
### <FIXME> doesn't work without hotstart, problem
### with computation of starting values??? </FIXME>
ms2 <- mlt(mod, data = d[sub,,drop = FALSE], offset = off[sub],
           theta = coef(ms1))
chk(coef(ms1), coef(ms2))
chk(estfun(ms1), estfun(ms2))
chk(vcov(ms1), vcov(ms2))
chk(logLik(ms1), logLik(ms2))

w <- runif(n)
ms1 <- update(fmod, weights = w, subset = sub)
ms2 <- mlt(mod, data = d[sub,,drop = FALSE],
           weights = w[sub], offset = off[sub], theta = coef(ms1))
chk(coef(ms1), coef(ms2))
chk(estfun(ms1), estfun(ms2))
chk(vcov(ms1), vcov(ms2))
chk(logLik(ms1), logLik(ms2))


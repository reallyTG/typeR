
library("tram")
library("survival")

### Windows diffs...
options(digits = 3)

tol <- .Machine$double.eps^(1/5)

cmp <- function(x, y)
    stopifnot(isTRUE(all.equal(x, y, tolerance = tol, check.attributes = FALSE)))

data("GBSG2", package = "TH.data")

fm <- Surv(time, cens) ~ pnodes + age
tfm <- Surv(time, cens) ~ pnodes + age
fms <- Surv(time, cens) ~ pnodes + age + strata(horTh)
tfms <- Surv(time, cens) | 0 + horTh ~ pnodes + age

(smod <- survreg(fm, data = GBSG2, dist = "weibull"))
(Smod <- Survreg(tfm, data = GBSG2, dist = "weibull"))
cmp(coef(smod), coef(Smod, as.survreg = TRUE))
cmp(logLik(smod), logLik(Smod))
Smod$invscale
summary(Smod)

(smod <- survreg(fms, data = GBSG2, dist = "weibull"))
(Smod <- Survreg(tfms, data = GBSG2, dist = "weibull"))
try(coef(Smod, as.survreg = TRUE))
Smod$invscale
summary(Smod)

(smod <- survreg(fm, data = GBSG2, dist = "exponential"))
(Smod <- Survreg(tfm, data = GBSG2, dist = "exponential"))
cmp(coef(smod), coef(Smod, as.survreg = TRUE))
cmp(logLik(smod), logLik(Smod))
Smod$invscale
summary(Smod)

try(smod <- survreg(fms, data = GBSG2, dist = "exponential"))
(Smod <- Survreg(tfms, data = GBSG2, dist = "exponential"))
try(coef(Smod, as.survreg = TRUE))
Smod$invscale
summary(Smod)

(smod <- survreg(fm, data = GBSG2, dist = "rayleigh"))
(Smod <- Survreg(tfm, data = GBSG2, dist = "rayleigh"))
cmp(coef(smod), coef(Smod, as.survreg = TRUE))
cmp(logLik(smod), logLik(Smod))
Smod$invscale
summary(Smod)

try(smod <- survreg(fms, data = GBSG2, dist = "rayleigh"))
(Smod <- Survreg(tfms, data = GBSG2, dist = "rayleigh"))
try(coef(Smod, as.survreg = TRUE))
Smod$invscale
summary(Smod)

(smod <- survreg(fm, data = GBSG2, dist = "lognormal"))
(Smod <- Survreg(tfm, data = GBSG2, dist = "lognormal"))
cmp(coef(smod), coef(Smod, as.survreg = TRUE))
cmp(logLik(smod), logLik(Smod))
summary(Smod)

(smod <- survreg(fms, data = GBSG2, dist = "lognormal"))
(Smod <- Survreg(tfms, data = GBSG2, dist = "lognormal"))
try(coef(Smod, as.survreg = TRUE))
Smod$invscale
summary(Smod)

(smod <- survreg(fm, data = GBSG2, dist = "loglogistic"))
(Smod <- Survreg(tfm, data = GBSG2, dist = "loglogistic"))
cmp(coef(smod), coef(Smod, as.survreg = TRUE))
cmp(logLik(smod), logLik(Smod))
Smod$invscale
summary(Smod)

(smod <- survreg(fms, data = GBSG2, dist = "loglogistic"))
(Smod <- Survreg(tfms, data = GBSG2, dist = "loglogistic"))
try(coef(Smod, as.survreg = TRUE))
Smod$invscale
summary(Smod)

(tobinfit <- survreg(Surv(durable, durable>0, type='left') ~ age + quant,
                         data=tobin, dist='gaussian'))
(tobinfit2 <- Survreg(Surv(durable, durable>0, type='left') ~ age + quant,
                         data=tobin, dist='gaussian'))
cmp(coef(tobinfit), coef(tobinfit2, as.survreg = TRUE))
cmp(logLik(tobinfit), logLik(tobinfit2))
summary(tobinfit2)

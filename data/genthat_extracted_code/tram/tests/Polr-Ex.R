
library("MASS")
library("tram")

### Windows diffs...
options(digits = 3)

tol <- .Machine$double.eps^(1/4)

cmp <- function(x, y)
    stopifnot(isTRUE(all.equal(x, y, tolerance = tol)))

(house.plr <- polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing))
summary(house.plr)

(house.plr2 <- Polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing))
summary(house.plr2)

cmp(coef(house.plr), coef(house.plr2))
ll <- logLik(house.plr)
attr(ll, "nobs") <- NULL
cmp(ll, logLik(house.plr2))

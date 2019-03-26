library(robustbase)


### Name: covMcd
### Title: Robust Location and Scatter Estimation via MCD
### Aliases: covMcd print.mcd .MCDcons .MCDcnp2 .MCDcnp2.rew
###   .MCDsingularityMsg .wgtFUN.covMcd
### Keywords: robust multivariate

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
set.seed(17)
(cH <- covMcd(hbk.x))
cH0 <- covMcd(hbk.x, nsamp = "deterministic")
with(cH0, stopifnot(quan == 39,
     iBest == c(1:4,6), # 5 out of 6 gave the same
     identical(raw.weights, mcd.wt),
     identical(which(mcd.wt == 0), 1:14), all.equal(crit, -1.045500594135)))

## the following three statements are equivalent
c1 <- covMcd(hbk.x, alpha = 0.75)
c2 <- covMcd(hbk.x, control = rrcov.control(alpha = 0.75))
## direct specification overrides control one:
c3 <- covMcd(hbk.x, alpha = 0.75,
             control = rrcov.control(alpha=0.95))
c1

## Martin's smooth reweighting:

## List of experimental pre-specified wgtFUN() creators:
## Cutoffs may depend on  (n, p, control$beta) :
str(.wgtFUN.covMcd)

cMM <- covMcd(hbk.x, wgtFUN = "sm1.adaptive")

ina <- which(names(cH) == "call")
all.equal(cMM[-ina], cH[-ina]) # *some* differences, not huge (same 'best'):
stopifnot(all.equal(cMM[-ina], cH[-ina], tol = 0.2))




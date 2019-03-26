library(robustbase)


### Name: covComed
### Title: Co-Median Location and Scatter "Covariance" Estimator
### Aliases: covComed comedian COM .wgtFUN.covComed

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
(cc1 <- covComed(hbk.x))
(ccW <- covComed(hbk.x, reweight=TRUE))
cc0  <- covComed(hbk.x, n.iter=0)
cc0W <- covComed(hbk.x, n.iter=0, reweight=TRUE)

stopifnot(all.equal(unclass(cc0), # here, the 0-1 weights don't change:
                    cc0W[names(cc0)], tol=1e-12),
          which(cc1$weights == 0) == 1:14,
          which(ccW$weights == 0) == 1:14,
          which(cc0$weights == 0) == 1:14)

## Martin's smooth reweighting:

## List of experimental pre-specified wgtFUN() creators:
## Cutoffs may depend on  (n, p, control$beta) :
str(.wgtFUN.covComed)




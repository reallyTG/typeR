library(gnm)


### Name: vcov.gnm
### Title: Variance-covariance Matrix for Parameters in a Generalized
###   Nonlinear Model
### Aliases: vcov.gnm
### Keywords: models regression nonlinear

### ** Examples

set.seed(1)
## Fit the "UNIDIFF" mobility model across education levels
unidiff <- gnm(Freq ~ educ*orig + educ*dest +
               Mult(Exp(educ), orig:dest), family = poisson,
               data = yaish, subset = (dest != 7))
## Examine the education multipliers (differences on the log scale):
ind <- pickCoef(unidiff, "[.]educ")
educMultipliers <- getContrasts(unidiff, rev(ind))
## Now get the same standard errors using a suitable set of
## quadratic forms, by calling vcov() directly:
cmat <- contr.sum(ind)
sterrs <- sqrt(diag(t(cmat)
                    %*% vcov(unidiff)[ind, ind]
                    %*% cmat))
all(sterrs == (educMultipliers$SE)[-1]) ## TRUE




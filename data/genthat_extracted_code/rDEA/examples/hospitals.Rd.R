library(rDEA)


### Name: hospitals
### Title: Data on Japanese local public hospitals
### Aliases: hospitals

### ** Examples

data("hospitals", package="rDEA")
Y = hospitals[c('inpatients', 'outpatients')]
X = hospitals[c('labor', 'capital')]
W = hospitals[c('labor_price', 'capital_price')]
Z= hospitals[c('z1')]

## DEA score in input-oriented model
firms=1:20
di_naive = dea(XREF=X, YREF=Y, X=X[firms,], Y=Y[firms,], model="input", RTS="variable")
di_naive$thetaOpt

## added only for testing of the manual
library(maxLik)

## robust DEA score in input-oriented model with environmental inputs
di_env = dea.env.robust(X=X[firms,], Y=Y[firms,], Z=Z[firms,],
                        model="input", RTS="variable", L1, L2=100, alpha=0.05)
di_env$delta_hat_hat

## DEA score in cost-minimization model
ci_naive = dea(XREF=X, YREF=Y, X=X[firms,], Y=Y[firms,], W=W[firms,],
               model="costmin", RTS="variable")
ci_naive$XOpt
ci_naive$gammaOpt




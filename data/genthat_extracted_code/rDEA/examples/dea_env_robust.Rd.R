library(rDEA)


### Name: dea.env.robust
### Title: Bias-corrected data envelopment analysis with environmental
###   variables
### Aliases: dea.env.robust
### Keywords: DEA, non-parametric efficiency, technical efficiency, cost
###   efficiency

### ** Examples

## load data on Japanese hospitals (Besstremyannaya 2013, 2011)
data("hospitals", package="rDEA")
Y = hospitals[c('inpatients', 'outpatients')]
X = hospitals[c('labor', 'capital')]
Z = hospitals[c('z1')]

## Naive input-oriented DEA score for the first 20 firms
## under variable returns-to-scale
firms=1:20
di_naive = dea(XREF=X, YREF=Y, X=X[firms,], Y=Y[firms,],
               model="input", RTS="variable")
di_naive$thetaOpt

## added only for testing of the manual
library(maxLik)

## Bias-corrected DEA score in input-oriented model
## with environmental variables, variable returns-to-scale
di_env = dea.env.robust(
             X=X[firms,], Y=Y[firms,], Z=Z[firms,], model="input",
             RTS="variable", L2=100, alpha=0.05)
di_env$delta_hat_hat





library(rDEA)


### Name: dea
### Title: Data envelopment analysis scores
### Aliases: dea
### Keywords: DEA, non-parametric efficiency, technical efficiency, cost
###   efficiency

### ** Examples

## load data on Japanese hospitals (Besstremyannaya 2013, 2011)
data("hospitals", package="rDEA")

## inputs and outputs for analysis
Y = hospitals[c('inpatients', 'outpatients')]
X = hospitals[c('labor', 'capital')]
W = hospitals[c('labor_price', 'capital_price')]

## Naive input-oriented DEA score for the first 20 firms under variable returns-to-scale
firms=1:20
di_naive = dea(XREF=X, YREF=Y, X=X[firms,], Y=Y[firms,], model="input", RTS="variable")
di_naive$thetaOpt

## Naive DEA score in cost-minimization model for the first 20 firms under variable returns-to-scale
ci_naive = dea(XREF=X, YREF=Y, X=X[firms,], Y=Y[firms,], W=W[firms,],
               model="costmin", RTS="variable")
ci_naive$XOpt
ci_naive$gammaOpt





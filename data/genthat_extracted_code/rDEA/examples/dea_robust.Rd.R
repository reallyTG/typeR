library(rDEA)


### Name: dea.robust
### Title: Bias-corrected data envelopment analysis
### Aliases: dea.robust
### Keywords: DEA, non-parametric efficiency, technical efficiency, cost
###   efficiency

### ** Examples

## load data on Japanese hospitals (Besstremyannaya 2013, 2011)
data("hospitals", package="rDEA")
Y = hospitals[c('inpatients', 'outpatients')]
X = hospitals[c('labor', 'capital')]

## Naive input-oriented DEA score for the first 20 firms under variable returns-to-scale
firms=1:20
di_naive = dea(XREF=X, YREF=Y, X=X[firms,], Y=Y[firms,],
               model="input", RTS="variable")
di_naive$thetaOpt

## Bias-corrected DEA score in input-oriented model under variable returns-to-scale
di_robust = dea.robust(X=X[firms,], Y=Y[firms,], model="input",
                       RTS="variable", B, alpha=0.05, bw="cv")
di_robust$theta_hat_hat
di_robust$bias





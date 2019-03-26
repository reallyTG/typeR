library(phylolm)


### Name: phylolm-methods
### Title: Methods for class 'phylolm'.
### Aliases: print.phylolm summary.phylolm print.summary.phylolm
###   residuals.phylolm predict.phylolm vcov.phylolm logLik.phylolm
###   print.logLik.phylolm AIC.phylolm AIC.logLik.phylolm
###   extractAIC.phylolm nobs.phylolm plot.phylolm

### ** Examples

set.seed(321123)
tre = rcoal(50)
y = rTrait(n=1,phy=tre,model="BM")
fit = phylolm(y~1,phy=tre,model="BM")
summary(fit)
vcov(fit)




library(rms)


### Name: rmsMisc
### Title: Miscellaneous Design Attributes and Utility Functions
### Aliases: rmsMisc calibrate.rms vcov.rms vcov.cph vcov.Glm vcov.Gls
###   vcov.lrm vcov.ols vcov.orm vcov.psm oos.loglik oos.loglik.ols
###   oos.loglik.lrm oos.loglik.cph oos.loglik.psm oos.loglik.Glm Getlim
###   Getlimi related.predictors interactions.containing
###   combineRelatedPredictors param.order Penalty.matrix Penalty.setup
###   logLik.Gls logLik.ols logLik.rms AIC.rms nobs.rms lrtest univarLR
###   Newlabels Newlevels Newlabels.rms Newlevels.rms rmsArgs print.rms
###   print.lrtest survest.rms prModFit prStats reListclean formatNP
###   latex.naprint.delete html.naprint.delete removeFormulaTerms
### Keywords: models methods

### ** Examples

## Not run: 
##D f <- psm(S ~ x1 + x2 + sex + race, dist='gau')
##D g <- psm(S ~ x1 + sex + race, dist='gau', 
##D          fixed=list(scale=exp(f$parms)))
##D lrtest(f, g)
##D 
##D 
##D g <- Newlabels(f, c(x2='Label for x2'))
##D g <- Newlevels(g, list(sex=c('Male','Female'),race=c('B','W')))
##D nomogram(g)
## End(Not run)




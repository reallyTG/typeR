library(robustlmm)


### Name: rlmerMod-class
### Title: rlmerMod Class
### Aliases: coef.rlmerMod deviance.rlmerMod extractAIC.rlmerMod
###   family.rlmerMod fitted.rlmerMod fixef.rlmerMod formula.rlmerMod
###   isGLMM.rlmerMod isLMM.rlmerMod isNLMM.rlmerMod isREML.rlmerMod
###   logLik.rlmerMod model.frame.rlmerMod model.matrix.rlmerMod
###   nobs.rlmerMod predict.rlmerMod print.rlmerMod print.summary.rlmer
###   print.VarCorr.rlmerMod ranef.rlmerMod resid.rlmerMod rlmerMod-class
###   show,rlmerMod-method show.rlmerMod show.summary.rlmerMod
###   sigma.rlmerMod summary.rlmerMod summary.summary.rlmerMod
###   terms.rlmerMod update.rlmerMod VarCorr.rlmerMod
###   VarCorr.summary.rlmerMod vcov.rlmerMod vcov.summary.rlmerMod
###   weights.rlmerMod
### Keywords: classes

### ** Examples

showClass("rlmerMod")

## convert an object of type 'lmerMod' to 'rlmerMod'
## to use the methods provided by robustlmm
fm <- lmer(Yield ~ (1|Batch), Dyestuff)
rfm <- as(fm, "rlmerMod")
compare(fm, rfm)




library(spaMM)


### Name: extractors
### Title: Functions to extract various components of a fit
### Aliases: model.frame.HLfit model.matrix.HLfit extractors getDistMat
###   logLik logLik.HLfit fitted fitted.HLfit residuals residuals.HLfit
###   fixef fixef.HLfit formula formula.HLfit family family.HLfit terms
###   terms.HLfit nobs nobs.HLfit ranef ranef.HLfit print.ranef deviance
###   deviance.HLfit response dev_resids get_RLRTSim_args get_boot_response

### ** Examples

data("wafers")
m1 <- HLfit(y ~X1+X2+(1|batch),
          resid.model = ~ 1 ,data=wafers,HLmethod="ML")
fixef(m1)
ranef(m1)




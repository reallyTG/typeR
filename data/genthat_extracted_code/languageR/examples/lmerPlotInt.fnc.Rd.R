library(languageR)


### Name: lmerPlotInt.fnc
### Title: Plot the interaction of two linear numeric predictors in a model
###   fitted with lmer
### Aliases: lmerPlotInt.fnc
### Keywords: hplot

### ** Examples

  ## Not run: 
##D   require(lme4)
##D   require(optimx)
##D 	lexdec.lmer = lmer(RT~BNCw*Frequency+(1|Subject)+(1|Word), data=lexdec,
##D     control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D 	lmerPlotInt.fnc(lexdec.lmer, "BNCw", "Frequency", "BNCw:Frequency", 
##D     which="matplot")
## End(Not run)
  



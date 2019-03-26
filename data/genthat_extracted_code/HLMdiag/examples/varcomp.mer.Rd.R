library(HLMdiag)


### Name: varcomp.mer
### Title: Extracting variance components
### Aliases: varcomp.mer
### Keywords: models regression

### ** Examples

library(lme4)
fm1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)
varcomp.mer(fm1)




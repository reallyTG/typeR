library(glmmTMB)


### Name: fixef
### Title: Extract fixed-effects estimates
### Aliases: fixef fixef.glmmTMB
### Keywords: models

### ** Examples

data(sleepstudy, package = "lme4")
fixef(glmmTMB(Reaction ~ Days + (1|Subject) + (0+Days|Subject), sleepstudy))




library(arm)


### Name: extractDIC
### Title: Extract AIC and DIC from a 'mer' model
### Aliases: extractDIC extractDIC.merMod extractAIC.merMod
### Keywords: manip methods

### ** Examples

fm1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)
extractAIC(fm1)
extractDIC(fm1)




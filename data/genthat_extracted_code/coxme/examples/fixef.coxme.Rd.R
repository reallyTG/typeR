library(coxme)


### Name: fixef.coxme
### Title: Extraction functions for Coxme
### Aliases: fixef.coxme ranef.coxme vcov.coxme VarCorr.coxme
### Keywords: models survival

### ** Examples

rat1 <- coxme(Surv(time, status) ~ rx + (1|litter), rats)
fixed.effects(rat1)
vcov(rat1)
random.effects(rat1)[[1]]  #one value for each of the 50 litters
VarCorr(rat1)




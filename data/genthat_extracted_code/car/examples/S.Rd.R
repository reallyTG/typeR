library(car)


### Name: S
### Title: Modified Functions for Summarizing Linear, Generalized Linear,
###   and Some Other Models
### Aliases: S Confint S.lm S.glm S.default S.multinom S.polr S.lme
###   S.lmerMod S.glmerMod print.S.lm print.S.glm print.S.multinom
###   print.S.polr print.S.lme print.S.lmerMod print.S.glmerMod Confint.lm
###   Confint.glm Confint.multinom Confint.polr Confint.lme Confint.lmerMod
###   Confint.glmerMod Confint.default
### Keywords: models regression

### ** Examples

mod.prestige <- lm(prestige ~ education + income + type, Prestige)
S(mod.prestige, vcov.=hccm)
S(mod.prestige, brief=TRUE)
Confint(mod.prestige, vcov.=hccm)

# A logit model
mod.mroz <- glm(lfp ~ ., data=Mroz, family=binomial)
S(mod.mroz)

## Not run: 
##D # Using the bootstrap for standard errors
##D b1 <- Boot(mod.prestige)
##D S(mod.prestige, vcov.= vcov(b1))
##D Confint(b1) # run with the boot object to get corrected confidence intervals
## End(Not run)




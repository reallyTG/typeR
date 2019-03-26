library(HLMdiag)


### Name: leverage.default
### Title: Leverage for HLMs
### Aliases: leverage leverage.default leverage.lme leverage.lmerMod
###   leverage.mer
### Keywords: models regression

### ** Examples

library(lme4)
fm <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

# Observation level leverage
lev1 <- leverage(fm, level = 1)
head(lev1)

# Group level leverage
lev2 <- leverage(fm, level = "Subject")
head(lev2)




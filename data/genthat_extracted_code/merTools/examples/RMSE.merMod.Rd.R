library(merTools)


### Name: RMSE.merMod
### Title: Estimate the Root Mean Squared Error (RMSE) for a lmerMod
### Aliases: RMSE.merMod

### ** Examples

require(lme4)
m2 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
RMSE.merMod(m2)




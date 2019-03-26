library(merTools)


### Name: FEsim
### Title: Simulate fixed effects from merMod 'FEsim' simulates fixed
###   effects from merMod object posterior distributions
### Aliases: FEsim

### ** Examples

require(lme4)
m2 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
fe2 <- FEsim(m2, 25)
head(fe2)




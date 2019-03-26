library(merTools)


### Name: REsim
### Title: Simulate random effects from merMod 'REsim' simulates random
###   effects from merMod object posterior distributions
### Aliases: REsim

### ** Examples

require(lme4)
m2 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
re2 <- REsim(m2, 25)
head(re2)




library(lmerTest)


### Name: lmer
### Title: Fit Linear Mixed-Effects Models
### Aliases: lmer

### ** Examples


data("sleepstudy", package="lme4")
m <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
class(m) # lmerModLmerTest





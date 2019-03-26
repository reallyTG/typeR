library(lme4)


### Name: hatvalues.merMod
### Title: Diagonal elements of the hat matrix
### Aliases: hatvalues.merMod

### ** Examples

m <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
hatvalues(m)




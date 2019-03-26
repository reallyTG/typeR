library(cAIC4)


### Name: cAIC4-package
### Title: Conditional Akaike Information Criterion for 'lme4'
### Aliases: cAIC4-package cAIC4
### Keywords: package

### ** Examples

b <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

cAIC(b)




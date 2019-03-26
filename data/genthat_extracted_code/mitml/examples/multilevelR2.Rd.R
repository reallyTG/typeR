library(mitml)


### Name: multilevelR2
### Title: Calculate R-squared measures for multilevel models
### Aliases: multilevelR2

### ** Examples

require(lme4)
data(studentratings)

fml <- MathAchiev + ReadAchiev + CognAbility ~ 1 + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

implist <- mitmlComplete(imp, print=1:5)

fit <- with(implist, lmer(MathAchiev ~ 1 + CognAbility + (1|ID)))
multilevelR2(fit)




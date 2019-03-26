library(sem)


### Name: tsls
### Title: Two-Stage Least Squares
### Aliases: tsls tsls.formula tsls.default fitted.tsls residuals.tsls
###   coef.tsls vcov.tsls anova.tsls print.tsls summary.tsls
###   print.summary.tsls
### Keywords: models

### ** Examples

summary(tsls(Q ~ P + D, ~ D + F + A, data=Kmenta))     # demand equation

summary(tsls(Q ~ P + F + A, ~ D + F + A, data=Kmenta)) # supply equation

anova(tsls(Q ~ P + F + A, ~ D + F + A, data=Kmenta),
    tsls(Q ~ 1, ~ D + F + A, data=Kmenta))




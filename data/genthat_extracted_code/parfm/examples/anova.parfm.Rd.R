library(parfm)


### Name: anova.parfm
### Title: Analysis of Deviance for a parametric frailty model.
### Aliases: anova.parfm anova.parfmlist
### Keywords: models regression survival

### ** Examples

## No test: 
fit <- parfm(formula = Surv(time, status) ~ sex + age, cluster = "id",
             data = kidney, dist = "exponential", frailty = "gamma")
anova(fit)
fit2 <- parfm(formula = Surv(time, status) ~ sex, cluster = "id",
              data = kidney, dist = "exponential", frailty = "gamma")
anova(fit2, fit)
## End(No test)



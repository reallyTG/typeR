library(survMisc)


### Name: profLik
### Title: Profile likelihood for coefficients in a 'coxph' model
### Aliases: profLik

### ** Examples

data("pbc", package="survival")
c1 <- coxph(formula = Surv(time, status == 2) ~ age + edema + log(bili) +
                      log(albumin) + log(protime), data = pbc)
profLik(c1, col="red")





library(clubSandwich)


### Name: vcovCR.rma.mv
### Title: Cluster-robust variance-covariance matrix for a robu object.
### Aliases: vcovCR.rma.mv

### ** Examples

library(metafor)
data(hierdat, package = "robumeta")

mfor_fit <- rma.mv(effectsize ~ binge + followup + sreport + age, 
                 V = var, random = list(~ 1 | esid, ~ 1 | studyid),
                 data = hierdat)
mfor_fit

mfor_CR2 <- vcovCR(mfor_fit, type = "CR2")
mfor_CR2
coef_test(mfor_fit, vcov = mfor_CR2, test = c("Satterthwaite", "saddlepoint"))

Wald_test(mfor_fit, constraints = c(2,4), vcov = mfor_CR2)
Wald_test(mfor_fit, constraints = 2:5, vcov = mfor_CR2)




library(clubSandwich)


### Name: vcovCR.robu
### Title: Cluster-robust variance-covariance matrix for a robu object.
### Aliases: vcovCR.robu

### ** Examples

library(robumeta)
data(hierdat)

robu_fit <- robu(effectsize ~ binge + followup + sreport + age, 
                 data = hierdat, studynum = studyid, 
                 var.eff.size = var, modelweights = "HIER")
robu_fit

robu_CR2 <- vcovCR(robu_fit, type = "CR2")
robu_CR2
coef_test(robu_fit, vcov = robu_CR2, test = c("Satterthwaite", "saddlepoint"))

Wald_test(robu_fit, constraints = c(2,4), vcov = robu_CR2)
Wald_test(robu_fit, constraints = 2:5, vcov = robu_CR2)





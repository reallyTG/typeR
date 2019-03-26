library(clubSandwich)


### Name: vcovCR.rma.uni
### Title: Cluster-robust variance-covariance matrix for a rma.uni object.
### Aliases: vcovCR.rma.uni

### ** Examples

library(metafor)
data(corrdat, package = "robumeta")

mfor_fit <- rma.uni(effectsize ~ males + college + binge,
                     vi = var, data = corrdat, method = "FE")
mfor_fit
mfor_CR2 <- vcovCR(mfor_fit, type = "CR2", cluster = corrdat$studyid)
mfor_CR2
coef_test(mfor_fit, vcov = mfor_CR2, test = c("Satterthwaite", "saddlepoint"))
Wald_test(mfor_fit, constraints = 2:4, vcov = mfor_CR2)





library(mcglm)


### Name: ahs
### Title: Australian Health Survey
### Aliases: ahs
### Keywords: datasets

### ** Examples

require(mcglm)
data(ahs, package="mcglm")
form1 <- Ndoc ~ income + age
form2 <- Nndoc ~ income + age
Z0 <- mc_id(ahs)
fit.ahs <- mcglm(linear_pred = c(form1, form2),
                 matrix_pred = list(Z0, Z0), link = c("log","log"),
                 variance = c("poisson_tweedie","poisson_tweedie"),
                 data = ahs)
summary(fit.ahs)




library(MGLM)


### Name: coef
### Title: Extract Model Coefficients
### Aliases: coef coef,MGLMfit-method coef,MGLMreg-method
###   coef,MGLMsparsereg-method coef,MGLMtune-method

### ** Examples

library("MGLM")
data("rnaseq")
data <- rnaseq[, 1:6]
mnreg <- MGLMreg(formula = cbind(X1, X2, X3, X4, X5, X6) ~ log(totalReads) + 
treatment + age + gender, data = rnaseq, dist = "MN")
coef(mnreg)




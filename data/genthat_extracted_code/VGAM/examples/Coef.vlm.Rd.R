library(VGAM)


### Name: Coef.vlm
### Title: Extract Model Coefficients for VLM Objects
### Aliases: Coef.vlm
### Keywords: models regression

### ** Examples

set.seed(123); nn <- 1000
bdata <- data.frame(y = rbeta(nn, shape1 = 1, shape2 = 3))
fit <- vglm(y ~ 1, betaff, data = bdata, trace = TRUE)  # intercept-only model
coef(fit, matrix = TRUE)  # log scale
Coef(fit)  # On the original scale




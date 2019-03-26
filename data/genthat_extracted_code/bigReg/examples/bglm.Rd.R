library(bigReg)


### Name: bglm
### Title: Function to carry out generalized linear regression on a
###   data_frame data object
### Aliases: bglm

### ** Examples

require(parallel)
data("plasma", package = "bigReg")
plasma1 <- plasma
plasma1 <- data_frame(plasma1, 10, path = "outputs", nCores = 1)
plasma_glm <- bglm(ESR ~ fibrinogen + globulin, data = plasma1, family = binomial_("logit"))
summary(plasma_glm)




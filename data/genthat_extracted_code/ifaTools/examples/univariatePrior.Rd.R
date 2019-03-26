library(ifaTools)


### Name: univariatePrior
### Title: Univariate priors commonly used in IFA models
### Aliases: univariatePrior

### ** Examples

model <- univariatePrior("logit-norm", "x1", -1)
model$priorParam$values[1,1] <- -.6
model <- mxRun(model)
model$output$fit
model$output$gradient
model$output$hessian




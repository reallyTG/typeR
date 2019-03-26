library(NormalLaplace)


### Name: summary.nlFit
### Title: Summarizing Normal Laplace Distribution Fit
### Aliases: summary.nlFit print.summary.nlFit
### Keywords: distribution

### ** Examples

## Continuing the  nlFit() example:
param <- c(2, 2, 1, 1)
dataVector <- rnl(500, param = param)
fit <- nlFit(dataVector, hessian = TRUE)
print(fit)
summary(fit)




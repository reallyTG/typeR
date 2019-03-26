library(VarianceGamma)


### Name: summary.vgFit
### Title: Summarizing Variance Gamma Distribution Fit
### Aliases: summary.vgFit print.summary.vgFit

### ** Examples

### Continuing the  vgFit(.) example:
param <- c(0,0.5,0,0.5)
dataVector <- rvg(500, param = param)
fit <- vgFit(dataVector)
print(fit)
summary(fit)          




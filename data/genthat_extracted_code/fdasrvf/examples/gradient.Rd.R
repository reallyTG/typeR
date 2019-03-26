library(fdasrvf)


### Name: gradient
### Title: Gradient using finite differences
### Aliases: gradient
### Keywords: alignment srvf

### ** Examples

data("simu_data")
out = gradient(simu_data$f[,1],mean(diff(simu_data$time)))




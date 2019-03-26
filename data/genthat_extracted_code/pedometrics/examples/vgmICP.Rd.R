library(pedometrics)


### Name: vgmICP
### Title: Initial covariance parameters (ICP)
### Aliases: vgmICP

### ** Examples

data(meuse, package = "sp")
icp <- vgmICP(z = log(meuse$copper), coords = meuse[, 1:2])




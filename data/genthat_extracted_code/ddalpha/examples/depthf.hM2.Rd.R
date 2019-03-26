library(ddalpha)


### Name: depthf.hM2
### Title: Bivariate h-Mode Depth for Functional Data Based on the L^2
###   Metric
### Aliases: depthf.hM2
### Keywords: depth derivatives functional

### ** Examples

datafA = dataf.population()$dataf[1:20]
datafB = dataf.population()$dataf[21:50]

datafA2 = derivatives.est(datafA,deriv=c(0,1))
datafB2 = derivatives.est(datafB,deriv=c(0,1))

depthf.hM2(datafA2,datafB2)

depthf.hM2(datafA2,datafB2)$hM
# depthf.hM2(cbind(A2[,,1],A2[,,2]),cbind(B2[,,1],B2[,,2]))$hM
# the two expressions above should give the same result





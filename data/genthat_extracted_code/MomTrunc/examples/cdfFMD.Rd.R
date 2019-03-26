library(MomTrunc)


### Name: cdfFMD
### Title: Cumulative distribution function for folded multivariate
###   distributions
### Aliases: cdfFMD
### Keywords: Folded Multivariate Normal Student's t

### ** Examples

mu = c(0.1,0.2,0.3,0.4)
Sigma = matrix(data = c(1,0.2,0.3,0.1,0.2,1,0.4,-0.1,0.3,0.4,1,0.2,0.1,-0.1,0.2,1),
               nrow = length(mu),ncol = length(mu),byrow = TRUE)
nu = 4
cdfFMD(x = c(0.5,0.2,1.0,1.3),mu,Sigma) #normal case
cdfFMD(x = c(0.5,0.2,1.0,1.3),mu,Sigma,dist = "t",nu) #t case




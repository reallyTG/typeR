library(MomTrunc)


### Name: meanvarFMD
### Title: Mean and variance for folded multivariate distributions
### Aliases: meanvarFMD
### Keywords: Folded Multivariate Student's t Normal

### ** Examples

mu = c(0.1,0.2,0.3)
Sigma = matrix(data = c(1,0.2,0.3,0.2,1,0.4,0.3,0.4,1),
               nrow = length(mu),ncol = length(mu),byrow = TRUE)
nu = 4
value1 = meanvarFMD(mu,Sigma) #normal case
value2 = meanvarFMD(mu,Sigma,dist = "t",nu) #t case




library(MomTrunc)


### Name: momentsFMD
### Title: Moments for folded multivariate distributions
### Aliases: momentsFMD
### Keywords: Folded Multivariate Student's t Normal

### ** Examples

mu = c(0.1,0.2,0.3)
Sigma = matrix(data = c(1,0.2,0.3,0.2,1,0.4,0.3,0.4,1),
               nrow = length(mu),ncol = length(mu),byrow = TRUE)
nu = 7
value1 = momentsFMD(c(2,0,1),mu,Sigma) #normal case
value2 = momentsFMD(c(0,2,0),mu,Sigma,dist = "t",nu) #t case




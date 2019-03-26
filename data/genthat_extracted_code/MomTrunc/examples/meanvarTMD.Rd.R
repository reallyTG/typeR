library(MomTrunc)


### Name: meanvarTMD
### Title: Mean and variance for doubly truncated multivariate
###   distributions
### Aliases: meanvarTMD
### Keywords: Truncated Multivariate Student's t Normal

### ** Examples

a = c(-0.8,-0.7,-0.6)
b = c(0.5,0.6,0.7)
mu = c(0.1,0.2,0.3)
Sigma = matrix(data = c(1,0.2,0.3,0.2,1,0.4,0.3,0.4,1),
               nrow = length(mu),ncol = length(mu),byrow = TRUE)
nu = 4
value1 = meanvarTMD(a,b,mu,Sigma) #normal case
value2 = meanvarTMD(a,b,mu,Sigma,dist = "t",nu) #t case




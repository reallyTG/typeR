library(MomTrunc)


### Name: momentsTMD
### Title: Moments for doubly truncated multivariate distributions
### Aliases: momentsTMD
### Keywords: Truncated Multivariate Student's t Normal

### ** Examples

a = c(-0.8,-0.7,-0.6)
b = c(0.5,0.6,0.7)
mu = c(0.1,0.2,0.3)
Sigma = matrix(data = c(1,0.2,0.3,0.2,1,0.4,0.3,0.4,1),
               nrow = length(mu),ncol = length(mu),byrow = TRUE)
nu = 7
value1 = momentsTMD(c(2,0,1),a,b,mu,Sigma) #normal case
value2 = momentsTMD(c(2,0,1),a,b,mu,Sigma,dist = "t",nu) #t case




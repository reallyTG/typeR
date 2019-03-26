library(pifpaf)


### Name: paf.linear
### Title: Population Attributable Fraction with Linear Relative Risk
###   Function
### Aliases: paf.linear

### ** Examples


#Example 1: Univariate relative risk
#----------------------------------------
set.seed(18427)
X <- data.frame(Exposure = rnorm(100,3,.5))
thetahat <- c(1, 0.12)   #Linear risk given by 1 + 0.12*X
paf.linear(X, thetahat)

#This is the same as doing:
paf(X, thetahat, rr = function(X, theta){X*theta[2] + theta[1]})

#Same example with kernel method
paf.linear(X, thetahat,  method = "kernel")

#Same example with approximate method
Xmean <- data.frame(mean(X[,"Exposure"]))
Xvar  <- var(X)
paf.linear(Xmean, thetahat, method = "approximate", Xvar = Xvar)

#Example 2: Multivariate relative risk
#----------------------------------------
X     <- data.frame(Exposure = rnorm(100,2,.7), Covariate = rnorm(100,4,1))
theta <- c(1, 0.3,0.1)
paf.linear(X, theta)   #Linear risk given by 1 + 0.3*X1 + 0.1*X2 

#Example 3: Polynomial relative risk
#----------------------------------------
X     <- runif(100)
X2    <- X^2
X3    <- X^3
matX  <- data.frame(X,X2,X3)
theta <- c(1, 0.3,0.1, 0.4)
paf.linear(matX,theta) #Polynomial risk: 1 + 0.3*X + 0.1*X^2 + 0.4*X^3





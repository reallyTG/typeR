library(pifpaf)


### Name: paf.exponential
### Title: Population Attributable Fraction with Exponential Relative Risk
###   Function
### Aliases: paf.exponential

### ** Examples


#Example 1: Univariate relative risk
#----------------------------------------
set.seed(18427)
X <- data.frame(Exposure = rnorm(100, 3, .5))
thetahat <- 0.12
paf.exponential(X, thetahat) #Exponential risk given exp(0.12*X)

#This is the same as doing:
paf(X, thetahat, rr = function(X, theta){exp(X*theta)})

#Same example with kernel method
paf.exponential(X, thetahat,  method = "kernel")

#Same example with approximate method
Xmean <- data.frame(mean(X[,"Exposure"]))
Xvar  <- var(X)
paf.exponential(Xmean, thetahat, method = "approximate", Xvar = Xvar)

#Example 2: Multivariate relative risk
#----------------------------------------
X     <- data.frame(Exposure = rnorm(100,2,.7), Covariate = rnorm(100,4,1))
theta <- c(0.3,0.1)
paf.exponential(X,theta) #Exponential risk given exp(0.3*X1 + 0.1*X2)





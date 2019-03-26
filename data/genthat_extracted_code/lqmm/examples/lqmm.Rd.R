library(lqmm)


### Name: lqmm
### Title: Fitting Linear Quantile Mixed Models
### Aliases: lqmm
### Keywords: quantile regression

### ** Examples


# Test example
set.seed(123)

M <- 50
n <- 10
test <- data.frame(x = runif(n*M,0,1), group = rep(1:M,each=n))
test$y <- 10*test$x + rep(rnorm(M, 0, 2), each = n) + rchisq(n*M, 3)
fit.lqmm <- lqmm(fixed = y ~ x, random = ~ 1, group = group,	
	data = test, tau = 0.5, nK = 11, type = "normal")
fit.lqmm

#Call: lqmm(fixed = y ~ x, random = ~1, group = group, tau = 0.5, nK = 11, 
#    type = "normal", data = test)
#Quantile 0.5 

#Fixed effects:
#(Intercept)            x  
#      3.443        9.258  

#Covariance matrix of the random effects:
#(Intercept) 
#      3.426 

#Residual scale parameter: 0.8697 (standard deviation 2.46)
#Log-likelihood: -1178 

#Number of observations: 500 
#Number of groups: 50 


## Orthodont data
data(Orthodont)

# Random intercept model
fitOi.lqmm <- lqmm(distance ~ age, random = ~ 1, group = Subject,
	tau = c(0.1,0.5,0.9), data = Orthodont)
coef(fitOi.lqmm)

# Random slope model
fitOs.lqmm <- lqmm(distance ~ age, random = ~ age, group = Subject,
	tau = c(0.1,0.5,0.9), cov = "pdDiag", data = Orthodont)

# Extract estimates
VarCorr(fitOs.lqmm)
coef(fitOs.lqmm)
ranef(fitOs.lqmm)

# AIC
AIC(fitOi.lqmm)
AIC(fitOs.lqmm)





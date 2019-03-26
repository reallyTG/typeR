library(sAIC)


### Name: sAIC
### Title: Compute the Akaike information criterion for the lasso in
###   generalized linear models
### Aliases: sAIC
### Keywords: models regression

### ** Examples

library(MASS)
library(glmnet)
library(glasso)

### logistic model
set.seed(3)
n <- 100; np <- 10; beta <- c(rep(0.5,3), rep(0,np-3))
Sigma <- diag( rep(1,np) )
for(i in 1:np) for(j in 1:np) Sigma[i,j] <- 0.5^(abs(i-j))
x <- mvrnorm(n, rep(0, np), Sigma)
y <- rbinom(n,1,1-1/(1+exp(x%*%beta)))
glmnet.object <- glmnet(x,y,family="binomial",alpha=1)
coef.glmnet <- coef(glmnet.object)
### coefficients
coef.glmnet[ ,10]
### AIC
sAIC(x=x, y=y, beta=coef.glmnet[ ,10], family="binomial")

### Poisson model
set.seed(1)
n <- 100; np <- 10; beta <- c(rep(0.5,3), rep(0,np-3))
Sigma <- diag( rep(1,np) )
for(i in 1:np) for(j in 1:np) Sigma[i,j] <- 0.5^(abs(i-j))
x <- mvrnorm(n, rep(0, np), Sigma)
y <- rpois(n,exp(x%*%beta))
glmnet.object <- glmnet(x,y,family="poisson",alpha=1)
coef.glmnet <- coef(glmnet.object)
### coefficients
coef.glmnet[ ,20]
### AIC
sAIC(x=x, y=y, beta=coef.glmnet[ ,20], family="poisson")

### Gaussian graphical model
set.seed(1)
n <- 100; np <- 10; lambda_list <- 1:100/50
invSigma <- diag( rep(0,np) )
for(i in 1:np) 
{
	for(j in 1:np)
	{
		if( i == j ) invSigma[i ,j] <- 1
		if( i == (j-1) || (i-1) == j ) invSigma[i ,j] <- 0.5
	}
}
Sigma <- solve(invSigma)
x <- scale(mvrnorm(n, rep(0, np), Sigma))
glasso.object <- glassopath(var(x), rholist=lambda_list, trace=0)
### AIC
sAIC(x=x, beta=glasso.object$wi[,,10], family="ggm")




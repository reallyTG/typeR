library(GAMBoost)


### Name: GLMBoost
### Title: Generalized linear model by likelihood based boosting
### Aliases: GLMBoost
### Keywords: models regression

### ** Examples

##  Generate some data 
x <- matrix(runif(100*8,min=-1,max=1),100,8)             
eta <- -0.5 + 2*x[,1] + 4*x[,3]
y <- rbinom(100,1,binomial()$linkinv(eta))

##  Fit a model with only linear components
gb1 <- GLMBoost(x,y,penalty=100,stepno=100,trace=TRUE,family=binomial()) 

#   Inspect the AIC for a minimum
plot(gb1$AIC) 

#   print the selected covariates, i.e., covariates with non-zero estimates
getGAMBoostSelected(gb1)

##  Make the first two covariates mandatory

gb2 <- GLMBoost(x,y,penalty=c(0,0,rep(100,ncol(x)-2)),
                stepno=100,family=binomial(),trace=TRUE) 





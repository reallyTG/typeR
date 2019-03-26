library(CoxBoost)


### Name: iCoxBoost
### Title: Interface for cross-validation and model fitting using a formula
###   description
### Aliases: iCoxBoost
### Keywords: models regression survial

### ** Examples

#   Generate some survival data with 10 informative covariates 
n <- 200; p <- 100
beta <- c(rep(1,2),rep(0,p-2))
x <- matrix(rnorm(n*p),n,p)
actual.data <- as.data.frame(x)
real.time <- -(log(runif(n)))/(10*exp(drop(x %*% beta)))
cens.time <- rexp(n,rate=1/10)
actual.data$status <- ifelse(real.time <= cens.time,1,0)
actual.data$time <- ifelse(real.time <= cens.time,real.time,cens.time)

#   Fit a Cox proportional hazards model by iCoxBoost

## No test: 
cbfit <- iCoxBoost(Surv(time,status) ~ .,data=actual.data) 
summary(cbfit)
plot(cbfit)
## End(No test)

#   ... with covariates 1 and 2 being mandatory

## No test: 
cbfit.mand <- iCoxBoost(Surv(time,status) ~ .,data=actual.data,mandatory=c("V1")) 
summary(cbfit.mand)
plot(cbfit.mand)
## End(No test)






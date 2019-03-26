library(CoxBoost)


### Name: predict.iCoxBoost
### Title: Predict method for iCoxBoost fits
### Aliases: predict.iCoxBoost
### Keywords: models regression survial

### ** Examples

n <- 200; p <- 100
beta <- c(rep(1,2),rep(0,p-2))
x <- matrix(rnorm(n*p),n,p)
actual.data <- as.data.frame(x)
real.time <- -(log(runif(n)))/(10*exp(drop(x %*% beta)))
cens.time <- rexp(n,rate=1/10)
actual.data$status <- ifelse(real.time <= cens.time,1,0)
actual.data$time <- ifelse(real.time <= cens.time,real.time,cens.time)

#   define training and test set

train.index <- 1:100
test.index <- 101:200

#   Fit a Cox proportional hazards model by iCoxBoost

## No test: 
cbfit <- iCoxBoost(Surv(time,status) ~ .,data=actual.data[train.index,],
				   stepno=300,cv=FALSE)
## End(No test)

#   mean partial log-likelihood for test set in every boosting step

## No test: 
step.logplik <- predict(cbfit,newdata=actual.data[test.index,],
                        at.step=0:300,type="logplik")

plot(step.logplik)
## End(No test)

#   names of covariates with non-zero coefficients at boosting step
#   with maximal test set partial log-likelihood

## No test: 
print(coef(cbfit,at.step=which.max(step.logplik)-1))
## End(No test)





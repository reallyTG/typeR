library(SPOT)


### Name: buildKrigingDACE
### Title: Build DACE model
### Aliases: buildKrigingDACE

### ** Examples

## Create design points
x <- cbind(runif(20)*15-5,runif(20)*15)
## Compute observations at design points 
y <- funSphere(x)
## Create model with default settings
fit <- buildKrigingDACE(x,y)
## Print model parameters
print(fit)
## Create with different regression and correlation functions
fit <- buildKrigingDACE(x,y,control=list(regr=regpoly2,corr=corrspline))
## Print model parameters
print(fit)





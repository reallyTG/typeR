library(sdwd)


### Name: sdwd
### Title: fit the sparse DWD
### Aliases: sdwd
### Keywords: models regression

### ** Examples

# load the data
data(colon)
# fit the elastic-net penalized DWD with lambda2=1
fit = sdwd(colon$x, colon$y, lambda2=1)
print(fit)
# coefficients at some lambda value
c1 = coef(fit, s=0.005)
# make predictions
predict(fit, newx=colon$x[1:10, ], s=c(0.01, 0.005))





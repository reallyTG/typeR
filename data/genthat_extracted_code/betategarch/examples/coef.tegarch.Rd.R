library(betategarch)


### Name: coef.tegarch
### Title: Extraction methods for 'tegarch' objects
### Aliases: coef.tegarch fitted.tegarch logLik.tegarch print.tegarch
###   residuals.tegarch summary.tegarch vcov.tegarch
### Keywords: Statistical Models

### ** Examples

#simulate 500 observations from model with default parameter values:
set.seed(123)
y <- tegarchSim(500)

#estimate and store as 'mymodel':
mymod <- tegarch(y)

#print estimation result:
print(mymod)

#extract coefficients:
coef(mymod)

#extract log-likelihood:
logLik(mymod)

#plot fitted conditional standard deviations:
plot(fitted(mymod))

#plot all the fitted series:
plot(fitted(mymod, verbose=TRUE))

#histogram of standardised residuals:
hist(residuals(mymod))




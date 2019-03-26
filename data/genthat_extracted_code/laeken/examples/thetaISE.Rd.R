library(laeken)


### Name: thetaISE
### Title: Integrated squared error (ISE) estimator
### Aliases: thetaISE
### Keywords: manip

### ** Examples

data(eusilc)
# equivalized disposable income is equal for each household
# member, therefore only one household member is taken
eusilc <- eusilc[!duplicated(eusilc$db030),]

# estimate threshold
ts <- paretoScale(eusilc$eqIncome, w = eusilc$db090)

# using number of observations in tail
thetaISE(eusilc$eqIncome, k = ts$k, w = eusilc$db090)

# using threshold
thetaISE(eusilc$eqIncome, x0 = ts$x0, w = eusilc$db090)




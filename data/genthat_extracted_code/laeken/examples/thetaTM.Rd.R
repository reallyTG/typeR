library(laeken)


### Name: thetaTM
### Title: Trimmed mean estimator
### Aliases: thetaTM
### Keywords: manip

### ** Examples

data(eusilc)
# equivalized disposable income is equal for each household
# member, therefore only one household member is taken
eusilc <- eusilc[!duplicated(eusilc$db030),]

# estimate threshold
ts <- paretoScale(eusilc$eqIncome, w = eusilc$db090)

# using number of observations in tail
thetaTM(eusilc$eqIncome, k = ts$k)

# using threshold
thetaTM(eusilc$eqIncome, x0 = ts$x0)




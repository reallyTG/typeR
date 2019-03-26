library(laeken)


### Name: reweightOut
### Title: Reweight outliers in the Pareto model
### Aliases: reweightOut reweightOut.paretoTail
### Keywords: manip

### ** Examples

data(eusilc)

## gini coefficient without Pareto tail modeling
gini("eqIncome", weights = "rb050", data = eusilc)

## gini coefficient with Pareto tail modeling
# estimate threshold
ts <- paretoScale(eusilc$eqIncome, w = eusilc$db090,
    groups = eusilc$db030)
# estimate shape parameter
fit <- paretoTail(eusilc$eqIncome, k = ts$k,
    w = eusilc$db090, groups = eusilc$db030)
# calibration of outliers
w <- reweightOut(fit, calibVars(eusilc$db040))
gini(eusilc$eqIncome, w)




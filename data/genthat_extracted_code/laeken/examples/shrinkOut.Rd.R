library(laeken)


### Name: shrinkOut
### Title: Shrink outliers in the Pareto model
### Aliases: shrinkOut shrinkOut.paretoTail
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
# shrink outliers
eqIncome <- shrinkOut(fit)
gini(eqIncome, weights = eusilc$rb050)




library(laeken)


### Name: fitPareto
### Title: Fit income distribution models with the Pareto distribution
### Aliases: fitPareto
### Keywords: manip

### ** Examples

data(eusilc)


## gini coefficient without Pareto tail modeling
gini("eqIncome", weights = "rb050", data = eusilc)


## gini coefficient with Pareto tail modeling

# using number of observations in tail
eqIncome <- fitPareto(eusilc$eqIncome, k = 175,
    w = eusilc$db090, groups = eusilc$db030)
gini(eqIncome, weights = eusilc$rb050)

# using threshold
eqIncome <- fitPareto(eusilc$eqIncome, x0 = 44150,
    w = eusilc$db090, groups = eusilc$db030)
gini(eqIncome, weights = eusilc$rb050)




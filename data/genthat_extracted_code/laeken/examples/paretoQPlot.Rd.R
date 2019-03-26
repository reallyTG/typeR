library(laeken)


### Name: paretoQPlot
### Title: Pareto quantile plot
### Aliases: paretoQPlot
### Keywords: hplot

### ** Examples

data(eusilc)
# equivalized disposable income is equal for each household
# member, therefore only one household member is taken
eusilc <- eusilc[!duplicated(eusilc$db030),]

# with sample weights
paretoQPlot(eusilc$eqIncome, w = eusilc$db090)

# without sample weights
paretoQPlot(eusilc$eqIncome)




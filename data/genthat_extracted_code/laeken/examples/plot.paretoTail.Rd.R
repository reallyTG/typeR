library(laeken)


### Name: plot.paretoTail
### Title: Diagnostic plot for the Pareto tail model
### Aliases: plot.paretoTail
### Keywords: hplot

### ** Examples

data(eusilc)

# estimate threshold
ts <- paretoScale(eusilc$eqIncome, w = eusilc$db090,
    groups = eusilc$db030)

# estimate shape parameter
fit <- paretoTail(eusilc$eqIncome, k = ts$k,
    w = eusilc$db090, groups = eusilc$db030)

# produce plot
plot(fit)




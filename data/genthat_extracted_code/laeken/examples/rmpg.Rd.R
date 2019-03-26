library(laeken)


### Name: rmpg
### Title: Relative median at-risk-of-poverty gap
### Aliases: rmpg
### Keywords: survey

### ** Examples

data(eusilc)

# overall value
rmpg("eqIncome", weights = "rb050", data = eusilc)

# values by region
rmpg("eqIncome", weights = "rb050",
    breakdown = "db040", data = eusilc)




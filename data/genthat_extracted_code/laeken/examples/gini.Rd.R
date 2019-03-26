library(laeken)


### Name: gini
### Title: Gini coefficient
### Aliases: gini
### Keywords: survey

### ** Examples

data(eusilc)

# overall value
gini("eqIncome", weights = "rb050", data = eusilc)

# values by region
gini("eqIncome", weights = "rb050",
    breakdown = "db040", data = eusilc)




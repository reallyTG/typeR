library(laeken)


### Name: qsr
### Title: Quintile share ratio
### Aliases: qsr
### Keywords: survey

### ** Examples

data(eusilc)

# overall value
qsr("eqIncome", weights = "rb050", data = eusilc)

# values by region
qsr("eqIncome", weights = "rb050",
    breakdown = "db040", data = eusilc)




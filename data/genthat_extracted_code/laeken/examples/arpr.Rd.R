library(laeken)


### Name: arpr
### Title: At-risk-of-poverty rate
### Aliases: arpr
### Keywords: survey

### ** Examples

data(eusilc)

# overall value
arpr("eqIncome", weights = "rb050", data = eusilc)

# values by region
arpr("eqIncome", weights = "rb050",
    breakdown = "db040", data = eusilc)




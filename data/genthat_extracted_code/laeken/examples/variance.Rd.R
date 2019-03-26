library(laeken)


### Name: variance
### Title: Variance and confidence intervals of indicators on social
###   exclusion and poverty
### Aliases: variance
### Keywords: survey

### ** Examples

data(eusilc)
a <- arpr("eqIncome", weights = "rb050", data = eusilc)

## naive bootstrap
variance("eqIncome", weights = "rb050", design = "db040",
    data = eusilc, indicator = a, R = 50,
    bootType = "naive", seed = 123)

## bootstrap with calibration
variance("eqIncome", weights = "rb050", design = "db040",
    data = eusilc, indicator = a, R = 50,
    X = calibVars(eusilc$db040), seed = 123)




library(simPop)


### Name: contingencyWt
### Title: Weighted contingency coefficients
### Aliases: contingencyWt
### Keywords: category methods

### ** Examples


data(eusilcS)

## default method
contingencyWt(eusilcS$pl030, eusilcS$pb220a, weights = eusilcS$rb050)

## data.frame method
basic <- c("age", "rb090", "hsize", "pl030", "pb220a")
contingencyWt(eusilcS[, basic], weights = eusilcS$rb050)




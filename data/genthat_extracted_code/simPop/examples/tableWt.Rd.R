library(simPop)


### Name: tableWt
### Title: Weighted cross tabulation
### Aliases: tableWt
### Keywords: category

### ** Examples


data(eusilcS)
tableWt(eusilcS[, c("hsize", "db040")], weights = eusilcS$rb050)
tableWt(eusilcS[, c("rb090", "pb220a")], weights = eusilcS$rb050, 
    useNA = "ifany")





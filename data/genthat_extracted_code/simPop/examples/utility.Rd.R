library(simPop)


### Name: utility
### Title: Utility measures
### Aliases: utility utility utilityModal utilityIndicator

### ** Examples

data(eusilcS)
data(eusilcP)
## for fast caluclations, took a subsample
eusilcP <- eusilcP[1:15000, ]
utility(eusilcS, eusilcP)
data(eusilcS)
data(eusilcP)
utilityModal(eusilcS, eusilcP, "age")
utilityModal(eusilcS, eusilcP, "pl030", "ecoStat")
data(eusilcS)
data(eusilcP)
m1 <- meanWt(eusilcS$age, eusilcS$rb050) 
m2 <- mean(eusilcP$age)
utilityIndicator(m1, m2)




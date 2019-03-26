library(SensoMineR)


### Name: decat
### Title: DEscription of CATegories
### Aliases: decat
### Keywords: models

### ** Examples

### Example 1
data(chocolates)
## model (AOV): " descriptor = product + panelist "
resdecat<-decat(sensochoc, formul="~Product+Panelist", firstvar = 5)
barrow(resdecat$tabT)
barrow(t(resdecat$tabT), numr = 3, numc = 3)
barrow(resdecat$coeff, color = "orange") 

### Example 2
data(chocolates)
## model (AOV): " descriptor = product + panelist "
res2 <-decat(sensochoc, formul="~Product+Panelist", firstvar = 5,
    proba=1, graph = FALSE)




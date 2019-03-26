library(EDA)


### Name: LMDI
### Title: Log Mean Devisia Index method for energy decomposition analysis
### Aliases: LMDI print.LMDI

### ** Examples

library(EDA)
data(carbon)
data(factordata)
## set parameters
cdata <- carbon[,-c(1,2)]
C0 <- cdata[1,]
CT <- cdata[2,]
X0 <- factordata[[2]][1,]
XT <- factordata[[2]][2,]
## run LMDI model
ed1 <- LMDI(C0, CT, X0, XT)
ed1





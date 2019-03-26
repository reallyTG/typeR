library(GPoM)


### Name: regSeries
### Title: Estimates the monomial time series
### Aliases: regSeries

### ** Examples

data(TSallMod_nVar3_dMax2)
sprottK <- as.matrix(TSallMod_nVar3_dMax2$SprK$reconstr)[,2:4]
dMax <- 2
nVar <- dim(sprottK)[2]

#Example 1
polySeries2 <- regSeries(nVar, dMax, sprottK)

#Example 2
p <- c(1,3,1)
polySeries2 <- regSeries(nVar, dMax, sprottK, pReg=p)





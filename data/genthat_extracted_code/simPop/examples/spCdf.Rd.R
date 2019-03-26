library(simPop)


### Name: spCdf
### Title: (Weighted empirical) cumulative distribution function
### Aliases: spCdf
### Keywords: dplot

### ** Examples


data(eusilcS)
cdfS <- spCdf(eusilcS$netIncome, weights = eusilcS$rb050)
plot(cdfS, type="s")





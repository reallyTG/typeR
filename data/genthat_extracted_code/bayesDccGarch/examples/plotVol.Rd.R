library(bayesDccGarch)


### Name: plotVol
### Title: Plotting volatilities of time series
### Aliases: plotVol
### Keywords: plot volatility

### ** Examples


data(DaxCacNik)

mY = DaxCacNik[1:10,] # more data is necessary

out = bayesDccGarch(mY, nSim=1000)

## The code
plotVol(mY, out$H[,c("H_1,1","H_2,2","H_3,3")], c("DAX","CAC40","NIKKEI"))

## gives the result of ##
plot(out)





library(bayesDccGarch)


### Name: plot.bayesDccGarch
### Title: Plotting volatilities for Bayesian DCC-GARCH model
### Aliases: plot.bayesDccGarch plot
### Keywords: plot volatility

### ** Examples


data(DaxCacNik)

mY = DaxCacNik[1:10,] # more data is necessary

out = bayesDccGarch(mY, nSim=1000)
plot(out)





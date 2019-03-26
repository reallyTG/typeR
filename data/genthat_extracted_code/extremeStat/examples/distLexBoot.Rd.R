library(extremeStat)


### Name: distLexBoot
### Title: Bootstrapping uncertainty intervals for return periods
### Aliases: distLexBoot
### Keywords: bootstrap distribution dplot hplot montecarlo ts

### ** Examples


data(annMax)
dlf <- distLextreme(annMax, selection=c("wak","gum","gev","nor"))
dlfB <- distLexBoot(dlf, nbest=4, conf.lev=0.5, n=10) # n low for quick example tests
plotLexBoot(dlfB)





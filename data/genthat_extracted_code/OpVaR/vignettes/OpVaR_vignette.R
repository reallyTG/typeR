## ----setup, include=FALSE------------------------------------------------
library(knitr)

## ------------------------------------------------------------------------
library(OpVaR)
data(lossdat)

## ------------------------------------------------------------------------
opriskmodel=list()
for(i in 1:length(lossdat)){
  opriskmodel[[i]]=list()
}

## ------------------------------------------------------------------------
### Fit Frequency Distribution
opriskmodel[[1]]$freqdist=fitFreqdist(lossdat[[1]],"pois")
opriskmodel[[2]]$freqdist=fitFreqdist(lossdat[[2]],"pois")
opriskmodel[[3]]$freqdist=fitFreqdist(lossdat[[3]],"nbinom")
opriskmodel[[4]]$freqdist=fitFreqdist(lossdat[[4]],"nbinom")

## ------------------------------------------------------------------------
### fit Severity Distributions
opriskmodel[[1]]$sevdist=fitPlain(lossdat[[1]],"gamma")
opriskmodel[[2]]$sevdist=fitPlain(lossdat[[2]],"weibull")
opriskmodel[[3]]$sevdist=fitSpliced(lossdat[[3]],"gamma","gpd",method="Fixed",thresh=2000)
opriskmodel[[4]]$sevdist=fitSpliced(lossdat[[4]],"gamma","gpd",method="Fixed",thresh=2000)

## ------------------------------------------------------------------------
### Test Model Fit (Severities)
goftest(lossdat[[3]],opriskmodel[[3]]$sevdist)
plot(opriskmodel[[3]]$sevdist)
lines(density(lossdat[[3]]$Loss))

### Test Model Fit (Frequencies)
goftest(lossdat[[3]],opriskmodel[[3]]$freqdist)

## ------------------------------------------------------------------------
### Fit Dependency Model
opriskmodel[[1]]$dependency=fitDependency(lossdat[[1]],6)
opriskmodel[[2]]$dependency=fitDependency(lossdat[[1]],0)
opriskmodel[[4]]$dependency=fitDependency(lossdat[[4]],4)

## ------------------------------------------------------------------------
### Monte Carlo Simulation
mc_out=mcSim(opriskmodel,100,verbose=FALSE)

### Value-at-Risk Calculation
VaR(mc_out,.95)


## ------------------------------------------------------------------------
### Benchemark: Value-at-Risk by Single Loss Approximation
sla(opriskmodel,.95)

## ------------------------------------------------------------------------
opriskmodel2 = list()
opriskmodel2[[1]] = list()
opriskmodel2[[1]]$sevdist = buildSplicedSevdist("lgamma", c(1.23, 0.012), "gpd", c(200, 716, 0.9), 2000, 0.8)
opriskmodel2[[1]]$freqdist = buildFreqdist("pois", 50)

#generate plot if interpolation was performed
sla(opriskmodel2, alpha = 0.95, plot = TRUE) 


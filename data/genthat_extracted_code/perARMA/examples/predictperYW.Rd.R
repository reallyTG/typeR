library(perARMA)


### Name: predictperYW
### Title: Prediction for PAR model
### Aliases: predictperYW predseries

### ** Examples

data(volumes)
permest_out<-permest(t(volumes),24, 0.05, NaN,'volumes', pp=0)
xd=permest_out$xd
dev.set(which=1)
predictperYW(xd,24,2,NaN,956,end=980)

dev.set(which=1)
predictperYW(xd[1:980],24,2,NaN,1004)

data(volumes.sep)
dev.set(which=1)
realdata=c(volumes,volumes.sep)
predseries(realdata,t(volumes[1:980]),24,2,1004)




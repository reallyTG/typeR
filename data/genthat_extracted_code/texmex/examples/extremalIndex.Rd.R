library(texmex)


### Name: extremalIndex
### Title: Extremal index estimation and automatic declustering
### Aliases: extremalIndex extremalIndexRangeFit declust declust.default
###   declust.extremalIndex print.extremalIndex plot.declustered
###   print.declustered bootExtremalIndex evm.declustered
###   plot.extremalIndexRangeFit ggplot.extremalIndexRangeFit

### ** Examples


par(mfrow=c(2,2));
extremalIndexRangeFit(summer$O3,nboot=10)
ei <- extremalIndex(summer$O3,threshold=45)
plot(ei)
d <- declust(ei)
plot(d)
evm(d)

## fitting with covariates:

so2 <- extremalIndex(SO2,data=winter,threshold=15)
plot(so2)
so2 <- extremalIndex(SO2,data=winter,threshold=20)
plot(so2) ## fits better

so2.d <- declust(so2)
par(mfrow=c(1,1)); plot(so2.d)
so2.d.gpd <- evm(so2.d) # AIC 661.1

evm(so2.d,phi=~NO)
evm(so2.d,phi=~NO2)
evm(so2.d,phi=~O3) # better AIC 651.9
evm(so2.d,phi=~PM10)

so2.d.gpd.o3 <- evm(so2.d,phi=~O3)

par(mfrow=c(2,2)); plot(so2.d.gpd.o3)





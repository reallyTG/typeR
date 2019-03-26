library(lulcc)


### Name: approxExtrapDemand
### Title: Extrapolate land use area in time
### Aliases: approxExtrapDemand

### ** Examples


## Plum Island Ecosystems

## load observed land use maps
obs <- ObsLulcRasterStack(x=pie,
                   pattern="lu",
                   categories=c(1,2,3),
                   labels=c("forest","built","other"),
                   t=c(0,6,14))

## obtain demand scenario by interpolating between observed maps
dmd <- approxExtrapDemand(obs=obs, tout=c(0:14))

## plot
matplot(dmd, type="l", ylab="Demand (no. of cells)", xlab="Time point",
        lty=1, col=c("Green","Red","Blue"))
legend("topleft", legend=obs@labels, col=c("Green","Red","Blue"), lty=1)

## linear extrapolation is also possible
dmd <- approxExtrapDemand(obs=obs, tout=c(0:50))

## plot
matplot(dmd, type="l", ylab="Demand (no. of cells)", xlab="Time point",
        lty=1, col=c("Green","Red","Blue"))
legend("topleft", legend=obs@labels, col=c("Green","Red","Blue"), lty=1)





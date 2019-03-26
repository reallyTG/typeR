library(oce)


### Name: predict.tidem
### Title: Predict a Time Series from a Tidal Model
### Aliases: predict.tidem

### ** Examples


## Not run: 
##D library(oce)
##D # 1. tidal anomaly
##D data(sealevelTuktoyaktuk)
##D time <- sealevelTuktoyaktuk[["time"]]
##D elevation <- sealevelTuktoyaktuk[["elevation"]]
##D oce.plot.ts(time, elevation, type='l', ylab="Height [m]", ylim=c(-2, 6))
##D tide <- tidem(sealevelTuktoyaktuk)
##D lines(time, elevation - predict(tide), col="red")
##D abline(h=0, col="red")
##D 
##D # 2. prediction at specified times
##D data(sealevel)
##D m <- tidem(sealevel)
##D ## Check fit over 2 days (interpolating to finer timescale)
##D look <- 1:48
##D time <- sealevel[["time"]]
##D elevation <- sealevel[["elevation"]]
##D oce.plot.ts(time[look], elevation[look])
##D # 360s = 10 minute timescale
##D t <- seq(from=time[1], to=time[max(look)], by=360)
##D lines(t, predict(m, newdata=t), col='red')
##D legend("topright", col=c("black","red"),
##D legend=c("data","model"),lwd=1)
## End(Not run)





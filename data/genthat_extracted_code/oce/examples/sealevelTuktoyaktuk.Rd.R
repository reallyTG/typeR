library(oce)


### Name: sealevelTuktoyaktuk
### Title: Sea-level data set acquired in 1975 at Tuktoyaktuk
### Aliases: sealevelTuktoyaktuk

### ** Examples

## Not run: 
##D library(oce)
##D data(sealevelTuktoyaktuk)
##D time <- sealevelTuktoyaktuk[["time"]]
##D elevation <- sealevelTuktoyaktuk[["elevation"]]
##D oce.plot.ts(time, elevation, type='l', ylab="Height [m]", ylim=c(-2, 6))
##D legend("topleft", legend=c("Tuktoyaktuk (1975)","Detided"),
##D        col=c("black","red"),lwd=1)
##D tide <- tidem(sealevelTuktoyaktuk)
##D detided <- elevation - predict(tide)
##D lines(time, detided, col="red")
## End(Not run)





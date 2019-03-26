library(oce)


### Name: oce.plot.ts
### Title: Oce Variant of plot.ts
### Aliases: oce.plot.ts

### ** Examples


library(oce)
t0 <- as.POSIXct("2008-01-01", tz="UTC")
t <- seq(t0, length.out=48, by="30 min")
y <- sin(as.numeric(t - t0) * 2 * pi / (12 * 3600))
oce.plot.ts(t, y, type='l', xaxs='i')




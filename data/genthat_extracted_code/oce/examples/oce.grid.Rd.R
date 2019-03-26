library(oce)


### Name: oce.grid
### Title: Add a Grid to an Existing Oce Plot
### Aliases: oce.grid

### ** Examples

library(oce)
i <- imagep(volcano)
oce.grid(i, lwd=2)

data(sealevel)
i <- oce.plot.ts(sealevel[["time"]], sealevel[["elevation"]])
oce.grid(i, col='red')

data(ctd)
i <- plotTS(ctd)
oce.grid(i, col='red')

data(adp)
i <- plot(adp, which=1)
oce.grid(i, col='gray', lty=1)

data(echosounder)
i <- plot(echosounder)
oce.grid(i, col='pink', lty=1)





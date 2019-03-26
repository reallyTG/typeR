library(TideHarmonics)


### Name: ftide
### Title: Fit Tidal Data
### Aliases: ftide
### Keywords: models

### ** Examples

hfit1 <- ftide(Hillarys$SeaLevel, Hillarys$DateTime, hc60)
hfit2 <- ftide(Hillarys$Sea, Hillarys$Date, hc7, smsl=TRUE)
hfit1
hfit2




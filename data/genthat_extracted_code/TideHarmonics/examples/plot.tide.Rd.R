library(TideHarmonics)


### Name: plot.tide
### Title: Plot Tidal Object
### Aliases: plot.tide
### Keywords: hplot

### ** Examples

hfit1 <- ftide(Hillarys$SeaLevel, Hillarys$DateTime, hc60)
hfit2 <- ftide(Hillarys$Sea, Hillarys$Date, hc7, smsl=TRUE)
t1 <- as.POSIXct("2012-12-31 23:00", tz = "UTC")
t2 <- as.POSIXct("2013-01-02 14:00", tz = "UTC")
plot(hfit1, t1, t2)
plot(hfit2, t1, t2, split = TRUE)
plot(hfit2, t1, t2, split = TRUE, which = c("M2","S2"))
plot(hfit2, t1, t2, which = "M2", msl = FALSE)




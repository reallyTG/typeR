library(skyscapeR)


### Name: plotAz
### Title: Polar plot of orientations (azimuths)
### Aliases: plotAz

### ** Examples

# Plot some azimuth data:
az <- c(120, 100, 93, 97, 88, 115, 112, 67)
plotAz(az)

# To visualize this data against the common solar and lunar targets:
tt <- sky.objects(c('sun','moon'), epoch=-2000, lty=c(2,3))
plotAz(az, tt, loc=c(35,-8))




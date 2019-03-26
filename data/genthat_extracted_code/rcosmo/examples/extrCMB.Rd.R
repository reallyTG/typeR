library(rcosmo)


### Name: extrCMB
### Title: Extreme values
### Aliases: extrCMB

### ** Examples

## Download the map first
# downloadCMBMap(foreground = "smica", nside = 1024)
# df <- CMBDataFrame("CMB_map_smica1024.fits")
# cmbdf <- sampleCMB(df, sample.size = 1000)
#
# win1 <- CMBWindow(theta = c(pi/2,pi,pi/2), phi = c(0,0,pi/2))
# extrCMB(cmbdf, win1,5)
#
## Ploting the window and 5 top extreme values
# plot(win1)
# plot(extrCMB(cmbdf, win1,5), col ="blue", size = 4,add = TRUE)





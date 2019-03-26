library(rcosmo)


### Name: qqplotWin
### Title: Quantile-Quantile plots for 'CMBWindow's
### Aliases: qqplotWin

### ** Examples

## Download the map first
# downloadCMBMap(foreground = "smica", nside = 1024)
# df <- CMBDataFrame("CMB_map_smica1024.fits")
# cmbdf <- sampleCMB(df, sample.size = 10000)

# win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
# win2 <- CMBWindow(theta = c(2*pi/3,3*pi/4,3*pi/4, 2*pi/3),
#                   phi = c(pi/4,pi/4,pi/3,pi/3))

# qqplotWin(cmbdf, win1, win2)





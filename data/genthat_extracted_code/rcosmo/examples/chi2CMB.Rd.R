library(rcosmo)


### Name: chi2CMB
### Title: Chi-squared statistic for two 'CMBWindow's
### Aliases: chi2CMB

### ** Examples

## Download the map first
# downloadCMBMap(foreground = "smica", nside = 1024)
# df <- CMBDataFrame("CMB_map_smica1024.fits")
# cmbdf <- sampleCMB(df, sample.size = 1000)
#
# win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
# win2 <- CMBWindow(theta = c(pi/2,pi,pi/2),  phi = c(0,0,pi/2))
# plot(win1)
# plot(win2,col="green")
#
# chi2CMB(cmbdf, win1, win2)





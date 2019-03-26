library(rcosmo)


### Name: window.CMBDat
### Title: Get a sub window from a 'CMBDat' object
### Aliases: window.CMBDat

### ** Examples


win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))

## Ensure you have a FITS file with correct path
## before uncommenting and running the rest of the example:
# cmbdat <- CMBDat("CMB_map_smica1024.fits", mmap = TRUE)
# class(cmbdat)
# cmbdat.win <- window(cmbdat, new.window = win1)
# class(cmbdat.win)





library(rcosmo)


### Name: downloadCMBMap
### Title: Download CMB Maps from Planck Public Data Release.
### Aliases: downloadCMBMap

### ** Examples

## Download SMICA with \code{nside = 1024}
## and save in working directory
## as "CMB_map_smica1024.fits"
# downloadCMBMap(foreground = "smica", nside = 1024)
## Load the downloaded map into a CMBDataFrame
# sky <- CMBDataFrame("CMB_map_smica1024.fits")

## Download SMICA with Nside=2048 and save in the working directory
## as "CMB_map_smica2048.fits"
# downloadCMBMap(foreground = "smica", nside = 2048)

## Download COMMANDER with Nside=1024 and save in a specified folder,
## for example,
# dest <- "CMB_map_commander1024.fits"
# downloadCMBMap(foreground = "commander", nside = 1024, destfile = dest)





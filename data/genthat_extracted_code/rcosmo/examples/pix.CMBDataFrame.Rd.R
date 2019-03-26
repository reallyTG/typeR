library(rcosmo)


### Name: pix.CMBDataFrame
### Title: HEALPix pixel indices from 'CMBDataFrame'
### Aliases: pix.CMBDataFrame

### ** Examples

## First download the map
# downloadCMBMap(foreground = "smica", nside = 1024)
# df <- CMBDataFrame("CMB_map_smica1024.fits", sample.size = 800000)
# pix(df)

df <- CMBDataFrame(nside = 16, sample.size = 10, ordering = "nested")
pix(df)





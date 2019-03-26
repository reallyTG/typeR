library(rcosmo)


### Name: pixelArea
### Title: Area of a HEALPix pixel
### Aliases: pixelArea

### ** Examples

## First download the map
# downloadCMBMap(foreground = "smica", nside = 1024)
# df <- CMBDataFrame("CMB_map_smica1024.fits")
# pixelArea(df)

df1 <- CMBDataFrame(nside = 64,
                    coords = "cartesian",
                    ordering = "nested")
pixelArea(df1)





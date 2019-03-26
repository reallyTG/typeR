library(rcosmo)


### Name: areCompatibleCMBDFs
### Title: Check compatibleness of CMBDataFrames
### Aliases: areCompatibleCMBDFs

### ** Examples

a <- CMBDataFrame(nside = 2, ordering = "ring", coords = "cartesian")
b <- CMBDataFrame(nside = 1, ordering = "nested", coords = "spherical")
areCompatibleCMBDFs(a,b)

suppressMessages(areCompatibleCMBDFs(a,b))





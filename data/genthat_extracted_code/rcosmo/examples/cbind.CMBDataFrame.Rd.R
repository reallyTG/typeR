library(rcosmo)


### Name: cbind.CMBDataFrame
### Title: 'cbind' for CMBDataFrames
### Aliases: cbind.CMBDataFrame

### ** Examples

cmbdf <- CMBDataFrame(nside = 1, ordering = "nested", coords = "spherical")
cmbdf2 <- cbind(cmbdf, myData = rep(1, 12))
cmbdf2






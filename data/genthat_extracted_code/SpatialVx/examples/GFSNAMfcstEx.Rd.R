library(SpatialVx)


### Name: GFSNAMfcstEx
### Title: Example Verification Set
### Aliases: GFSNAMfcstEx GFSNAMobsEx GFSNAMlocEx
### Keywords: datasets

### ** Examples

data( "GFSNAMfcstEx" )
data( "GFSNAMobsEx" )
data( "GFSNAMlocEx" )

x <- colMeans(GFSNAMfcstEx, na.rm=TRUE)
y <- colMeans(GFSNAMobsEx, na.rm=TRUE)
look <- as.image(x - y, x=GFSNAMlocEx)
image.plot(look)




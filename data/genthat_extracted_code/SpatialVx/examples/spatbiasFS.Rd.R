library(SpatialVx)


### Name: spatbiasFS
### Title: Field Significance Method of Elmore et al. (2006)
### Aliases: spatbiasFS plot.spatbiasFS summary.spatbiasFS
### Keywords: math

### ** Examples

data(GFSNAMfcstEx)
data(GFSNAMobsEx)
data(GFSNAMlocEx)
id <- GFSNAMlocEx[,"Lon"] >=-95 & GFSNAMlocEx[,"Lon"] <= -75 & GFSNAMlocEx[,"Lat"] <= 32
loc <- GFSNAMlocEx[id,]
GFSobsSub <- GFSNAMobsEx[,id]
GFSfcstSub <- GFSNAMfcstEx[,id]
look <- spatbiasFS(GFSobsSub, GFSfcstSub, loc=loc, bootR=500, ntrials=500)
plot(look)
summary(look)




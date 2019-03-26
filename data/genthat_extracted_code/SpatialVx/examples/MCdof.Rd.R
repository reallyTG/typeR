library(SpatialVx)


### Name: MCdof
### Title: Monte Carlo Degrees of Freedom
### Aliases: MCdof sig.cor.t sig.cor.Z fisherz
### Keywords: distribution univar htest nonparametric

### ** Examples

data( "GFSNAMfcstEx" )
data( "GFSNAMobsEx" )
data( "GFSNAMlocEx" )

id <- GFSNAMlocEx[,"Lon"] >=-90 & GFSNAMlocEx[,"Lon"] <= -75 & GFSNAMlocEx[,"Lat"] <= 40

look <- MCdof(GFSNAMfcstEx[,id] - GFSNAMobsEx[,id], ntrials=500)

stats(look$MCprops)
look$minsigcov

fisherz( abs(cor(rnorm(10),rexp(10), use="pairwise.complete.obs")))





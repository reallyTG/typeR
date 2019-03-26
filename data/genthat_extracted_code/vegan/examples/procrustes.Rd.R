library(vegan)


### Name: procrustes
### Title: Procrustes Rotation of Two Configurations and PROTEST
### Aliases: procrustes summary.procrustes plot.procrustes
###   points.procrustes text.procrustes lines.procrustes
###   residuals.procrustes fitted.procrustes predict.procrustes protest
### Keywords: multivariate htest

### ** Examples

data(varespec)
vare.dist <- vegdist(wisconsin(varespec))
mds.null <- monoMDS(vare.dist, y = cmdscale(vare.dist))
mds.alt <- monoMDS(vare.dist)
vare.proc <- procrustes(mds.alt, mds.null)
vare.proc
summary(vare.proc)
plot(vare.proc)
plot(vare.proc, kind=2)
residuals(vare.proc)




library(labdsv)


### Name: plot.nmds
### Title: Plotting Routines For Nonmetric Multi-Dimensional Scaling
###   Ordinations
### Aliases: plot.nmds points.nmds plotid.nmds hilight.nmds chullord.nmds
###   surf.nmds density.nmds thull.nmds
### Keywords: hplot aplot iplot

### ** Examples

data(bryceveg)
data(brycesite)
dis.bc <- dsvdis(bryceveg,'bray/curtis')
nmds.1 <- nmds(dis.bc,5)
plot(nmds.1)
points(nmds.1,brycesite$elev>8000)
surf(nmds.1,brycesite$elev)
## Not run: plotid(nmds.1,ids=row.names(bryceveg))




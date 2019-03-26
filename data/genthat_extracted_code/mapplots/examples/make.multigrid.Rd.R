library(mapplots)


### Name: make.multigrid
### Title: Create a grd object
### Aliases: make.multigrid

### ** Examples

data(coast)
data(landings)
byx = 1
byy = 0.5
xlim <- c(-12.5,-5)
ylim <- c(50.25,56)
grd <- make.multigrid(landings$Lon,landings$Lat,landings$LiveWeight, landings$Species,
 byx, byy, xlim, ylim)
breaks <- breaks.grid(grd,zero=FALSE)
par(mfrow=c(2,3),mar=c(1,1,2,1) )
for(s in names(grd) ) {
  basemap(xlim, ylim, main = s, axes=FALSE)
  draw.grid(grd[[s]],breaks)
  draw.shape(coast, col="darkgreen")
}
plot.new()
legend.grid("center",breaks=breaks/1000,type=2)




library(sp)


### Name: spplot
### Title: Plot methods for spatial data with attributes
### Aliases: spplot spplot.grid spplot.locator spplot.polygons
###   spplot.points layout.north.arrow layout.scale.bar mapLegendGrob
###   sp.theme spplot-methods spplot,SpatialPixelsDataFrame-method
###   spplot,SpatialGridDataFrame-method
###   spplot,SpatialPolygonsDataFrame-method
###   spplot,SpatialLinesDataFrame-method
###   spplot,SpatialPointsDataFrame-method
###   spplot,SpatialMultiPointsDataFrame-method sppanel sppanel,Line-method
###   sppanel,Lines-method sppanel,NULL-method sppanel,SpatialGrid-method
###   sppanel,SpatialLines-method sppanel,SpatialPixels-method
###   sppanel,SpatialPoints-method sppanel,SpatialPolygons-method
###   sppanel,character-method sppanel,list-method panel.RgoogleMaps
###   panel.ggmap sppanel-methods set_col_regions get_col_regions
### Keywords: dplot

### ** Examples

library(lattice)
trellis.par.set(sp.theme()) # sets bpy.colors() ramp
demo(meuse, ask = FALSE, echo = FALSE)
l2 = list("SpatialPolygonsRescale", layout.north.arrow(), offset = c(181300,329800), 
	scale = 400)
l3 = list("SpatialPolygonsRescale", layout.scale.bar(), offset = c(180500,329800), 
	scale = 500, fill=c("transparent","black"))
l4 = list("sp.text", c(180500,329900), "0")
l5 = list("sp.text", c(181000,329900), "500 m")

spplot(meuse, c("ffreq"), sp.layout=list(l2,l3,l4,l5), col.regions= "black", 
	pch=c(1,2,3), key.space=list(x=0.1,y=.95,corner=c(0,1)))
spplot(meuse, c("zinc", "lead"), sp.layout=list(l2,l3,l4,l5, which = 2),
	key.space=list(x=0.1,y=.95,corner=c(0,1)))
# plotting factors:
meuse$f = factor(sample(letters[6:10], 155, replace=TRUE),levels=letters[1:10])
meuse$g = factor(sample(letters[1:5], 155, replace=TRUE),levels=letters[1:10])
spplot(meuse, c("f","g"), col.regions=bpy.colors(10))

if (require(RColorBrewer)) {
	spplot(meuse, c("ffreq"), sp.layout=list(l2,l3,l4,l5),
		col.regions=brewer.pal(3, "Set1"))
}

meuse.grid$g = factor(sample(letters[1:5], 3103, replace=TRUE),
	levels=letters[1:10])
meuse.grid$f = factor(sample(letters[6:10], 3103, replace=TRUE),
	levels=letters[1:10])
spplot(meuse.grid, c("f","g"), col.regions=bpy.colors(10))

# example modifying colorkey for points:
spplot(meuse["dist"], colorkey = list(
	right = list( # see ?levelplot in package trellis, argument colorkey:
		fun = draw.colorkey, 
		args = list(
			key = list(
				at = seq(0, 1, .1), # colour breaks
				col = bpy.colors(11), # colours
				labels = list(
					at = c(0, .2, .4, .6, .8, 1), 
					labels = c("0x", "20x", "40x", "60x", "80x", "100x")
				)
			)
		)
	)
))
l6 = list(meuse.grid["dist"], col = grey(seq(.5,.9,length.out=10)))
spplot(meuse, c("zinc", "lead"), sp.layout = l6)
spplot(meuse, c("zinc", "lead"), 
	sp.layout = list(meuse.grid, meuse.riv, col = 'grey'))

#  Custom legend placement, taken from 
# http://stackoverflow.com/questions/29344692/custom-placement-of-spplot-legend-in-the-map
s <- spplot(meuse.grid[,'dist'], colorkey = list(space = "left", height = 0.4))

args <- s$legend$left$args$key

## Prepare list of arguments needed by `legend=` argument (as described in ?xyplot)
library(lattice) # draw.colorkey
legendArgs <- list(fun = draw.colorkey,
                   args = list(key = args),
                   corner = c(0.05,.75))

## Call spplot() again, this time passing in to legend the arguments
## needed to print a color key
spplot(meuse.grid[,'dist'], colorkey = FALSE,
       legend = list(inside = legendArgs))




library(marmap)


### Name: plot.bathy
### Title: Ploting bathymetric data
### Aliases: plot.bathy

### ** Examples

# load NW Atlantic data and convert to class bathy
	data(nw.atlantic)
	atl <- as.bathy(nw.atlantic)

## Example 1: a simple marine chart
	plot(atl) # without specifying any isobath parameters
	plot(atl, n=5, drawlabels=TRUE) # with about 5 isobaths
	plot(atl, deep=-8000, shallow=0, step=1000) # with isobath parameters

## Example 2: taking advantage of multiple types of isobaths
	plot(atl, deep=c(-8000,-2000,0), shallow=c(-2000,-100,0), step=c(1000,100,0), 
		 lwd=c(0.5,0.5,1),lty=c(1,1,1),col=c("grey80","red", "blue"),
		 drawlabels=c(FALSE,FALSE,FALSE) )

## Example 3: plotting a colored map with the default color palette
	plot(atl, image=TRUE, deep=c(-8000,0), shallow=c(-1000,0), step=c(1000,0), 
	     lwd=c(0.5,1), lty=c(1,1), col=c("grey","black"), drawlabels=c(FALSE,FALSE))
     
## Example 4: make a pretty custom color ramp
	colorRampPalette(c("purple","lightblue","cadetblue2","cadetblue1","white")) -> blues

	plot(atl, image=TRUE, bpal=blues(100), deep=c(-6500,0), shallow=c(-50,0), step=c(500,0), 
	     lwd=c(0.3,1), lty=c(1,1), col=c("black","black"), drawlabels=c(FALSE,FALSE))
	
	scaleBathy(atl, deg=3, x="bottomleft", inset=5)
     
## Example 5: add points corresponding to sampling locations
##            point colors correspond to the sampling depth
	par(mai=c(1,1,1,1.5))
	plot(atl, deep=c(-4500,0), shallow=c(-50,0), step=c(500,0), 
	     lwd=c(0.3,1), lty=c(1,1), col=c("black","black"), drawlabels=c(FALSE,FALSE))
	
	# add a title to the plot
	title(main="Distribution of coral samples\non the New England and Corner Rise seamounts")
	# add a scale
	scaleBathy(atl, deg=3, x="bottomleft", inset=5)
	
	# add a geographical reference on the coast:
	points(-71.064,42.358, pch=19)
	text(-71.064,42.358,"Boston", adj=c(1.2,0))
	
	# prepare colors for the sampling locations:
	data(metallo) ## see dataset metallo
	max(metallo$depth, na.rm=TRUE) -> mx
	colorRampPalette(c("white","lightyellow","lightgreen","blue","lightblue1","purple")) -> ramp
	blues <- ramp(max(metallo$depth))
	
	# plot sampling locations:
	points(metallo, col="black", bg=blues[metallo$depth], pch=21,cex=1.5)
	library(shape)
	colorlegend(zlim=c(-mx,0), col=rev(blues), main="depth (m)",posx=c(0.85,0.88))

## Example 6: use packages maps and mapdata in combination with marmap
	# use maps and mapdata to plot the coast
	library(maps)
	library(mapdata)
	map('worldHires',xlim=c(-75,-46),ylim=c(32,44), fill=TRUE, col="grey")
	box();axis(1);axis(2)
	
	# add bathymetric data from 'bathy' data
    plot(atl, add=TRUE, lwd=.3, deep=-4500, shallow=-10, step=500, 
		drawlabel=FALSE, col="grey50")

## Example 7: provide a list of depths and colors to argument bpal to finely tune palette
	# check out ?palette.bathy to see details on how the palette is handled 
	
	# creating depth-constrained palette for the ocean only
	plot(atl, land = FALSE, n = 10, lwd = 0.5, image = TRUE,
	     bpal = list(c(min(atl), 0, "purple", "blue", "lightblue")),
	     default.col = "gray")
	
	# creating depth-constrained palette for 3 ocean "layers"
	plot(atl, land = FALSE, n = 10, lwd = 0.7, image = TRUE, 
	     bpal = list(c(min(atl), -3000, "purple","blue","grey"),
	                 c(-3000, -150, "white"),
	                 c(-150, 0, "yellow", "green", "brown")),
	     default.col = "grey")
	
	# creating depth-constrained palette for land and ocean
	plot(atl, land = TRUE, n = 10, lwd = 0.7, image = TRUE,
	     bpal = list(c(min(atl), 0, "purple", "blue", "lightblue"),
	                 c(0, max(atl), "gray90", "gray10")))




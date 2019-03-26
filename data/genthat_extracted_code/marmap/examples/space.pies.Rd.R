library(marmap)


### Name: space.pies
### Title: Automatic placement of piecharts on maps
### Aliases: space.pies

### ** Examples

# fake frequencies to feed to space.pies()
	sample(seq(10,90,5), 11)-> freq.a
	100-freq.a -> freq.b
	rep("lightblue",11) -> col.a
	rep("white",11) -> col.b
	
# some coordinates on the NW Atlantic coast, and on seamounts
	x = c(-74.28487,-73.92323,-73.80753,-72.51728,-71.12418,
		  -69.81176,-69.90715,-70.43201,-70.17135,-69.43912,-65.49608)
	y = c(39.36714,39.98515,40.40316,40.79654,41.49872,41.62076,
		  41.99805,42.68061,43.40714,43.81499,43.36471)
	pts.coast = data.frame(x,y, freq.a, freq.b, col.a, col.b)

	x = c(-66.01404,-65.47260,-63.75456,-63.26082,-62.12838,
	      -60.46885,-59.96952,-56.90925,-52.20397,-51.32288,-50.72461)
	y = c(39.70769,39.39064,38.83020,38.56479,38.01881,38.95405,
	      37.55675,34.62617,36.15592,36.38992,35.91779)
	pts.smt = data.frame(x,y, freq.a, freq.b, col.a, col.b)

# prepare the plot
	data(nw.atlantic) ; atl <- as.bathy(nw.atlantic)
	plot(atl, deep=-8000, shallow=0, step=1000,col="grey")
	points(pts.coast,pch=19,col="blue", cex=0.5)
	points(pts.smt,pch=19,col="blue", cex=0.5)

# automatic placement of piecharts with space.pies
	space.pies(pts.coast[,1], pts.coast[,2], 
	           pie.slices=pts.coast[,3:4], pie.colors=pts.coast[,5:6], pie.radius=0.5)
	space.pies(pts.smt[,1], pts.smt[,2], 
	           pie.slices=pts.smt[,3:4], pie.colors=pts.coast[,5:6], pie.radius=0.5)	




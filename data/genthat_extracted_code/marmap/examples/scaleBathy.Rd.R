library(marmap)


### Name: scaleBathy
### Title: Adds a scale to a map
### Aliases: scaleBathy

### ** Examples

# load NW Atlantic data and convert to class bathy
	data(nw.atlantic)
	atl <- as.bathy(nw.atlantic)

# a simple example
	plot(atl, deep=-8000, shallow=-1000, step=1000, lwd=0.5, col="grey")
	scaleBathy(atl, deg=4)

# using keywords to place the scale with inset=10%
	par(mfrow=c(2,2))
	plot(atl, deep=-8000, shallow=-1000, step=1000, lwd=0.5, col="grey")
	scaleBathy(atl, deg=4, x="bottomleft", y=NULL)
	plot(atl, deep=-8000, shallow=-1000, step=1000, lwd=0.5, col="grey")
	scaleBathy(atl, deg=4, x="bottomright", y=NULL)

# using keywords to place the scale with inset=20%
	plot(atl, deep=-8000, shallow=-1000, step=1000, lwd=0.5, col="grey")
	scaleBathy(atl, deg=4, x="topleft", y=NULL, inset=20)
	plot(atl, deep=-8000, shallow=-1000, step=1000, lwd=0.5, col="grey")
	scaleBathy(atl, deg=4, x="topright", y=NULL, inset=20) 





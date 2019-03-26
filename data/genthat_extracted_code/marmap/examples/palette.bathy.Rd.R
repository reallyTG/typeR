library(marmap)


### Name: palette.bathy
### Title: Builds a bathymetry- and/or topography-constrained color palette
### Aliases: palette.bathy

### ** Examples

# load NW Atlantic data and convert to class bathy
	data(nw.atlantic)
	atl <- as.bathy(nw.atlantic)

# creating depth-constrained palette for the ocean only
    newcol <- palette.bathy(mat=atl,
		layers = list(c(min(atl), 0, "purple", "blue", "lightblue")),
		land = FALSE, default.col = "grey" )
	plot(atl, land = FALSE, n = 10, lwd = 0.5, image = TRUE,
		bpal = newcol, default.col = "grey")

# same:
	plot(atl, land = FALSE, n = 10, lwd = 0.5, image = TRUE,
		bpal = list(c(min(atl), 0, "purple", "blue", "lightblue")),
		default.col = "gray")

# creating depth-constrained palette for 3 ocean "layers"
	newcol <- palette.bathy(mat = atl, layers = list(
		c(min(atl), -3000, "purple", "blue", "grey"),
		c(-3000, -150, "white"),
		c(-150, 0, "yellow", "green", "brown")),
		land = FALSE, default.col = "grey")
	plot(atl, land = FALSE, n = 10, lwd = 0.7, image = TRUE,
		bpal = newcol, default.col = "grey")

# same
	plot(atl, land = FALSE, n = 10, lwd = 0.7, image = TRUE,
		bpal = list(c(min(atl), -3000, "purple","blue","grey"),
					c(-3000, -150, "white"),
					c(-150, 0, "yellow", "green", "brown")),
		default.col = "grey")

# creating depth-constrained palette for land and ocean
	newcol <- palette.bathy(mat= atl, layers = list(
		c(min(atl),0,"purple","blue","lightblue"),
		c(0, max(atl), "gray90", "gray10")),
		land = TRUE)
	plot(atl, land = TRUE, n = 10, lwd = 0.5, image = TRUE, bpal = newcol)

# same
	plot(atl, land = TRUE, n = 10, lwd = 0.7, image = TRUE,
		bpal = list(
			c(min(atl), 0, "purple", "blue", "lightblue"),
			c(0, max(atl), "gray90", "gray10")))




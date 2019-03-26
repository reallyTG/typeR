library(marmap)


### Name: fortify.bathy
### Title: Extract bathymetry data in a data.frame
### Aliases: fortify.bathy

### ** Examples

# load NW Atlantic data and convert to class bathy
data(nw.atlantic)
atl <- as.bathy(nw.atlantic)

library("ggplot2")
# convert bathy object into a data.frame
head(fortify(atl))

# one can now use bathy objects with ggplot directly
ggplot(atl) + geom_contour(aes(x=x, y=y, z=z)) + coord_map()

# which allows complete plot configuration
atl.df <- fortify(atl)
ggplot(atl.df, aes(x=x, y=y)) + coord_quickmap() +
  geom_raster(aes(fill=z), data=atl.df[atl.df$z <= 0,]) +
  geom_contour(aes(z=z),
    breaks=c(-100, -200, -500, -1000, -2000, -4000),
    colour="white", size=0.1
  ) +
  scale_x_continuous(expand=c(0,0)) +
  scale_y_continuous(expand=c(0,0))




library(marmap)


### Name: etopo
### Title: Etopo colours
### Aliases: etopo etopo.colors etopo.colours scale_color_etopo
###   scale_colour_etopo scale_fill_etopo

### ** Examples

# load NW Atlantic data and convert to class bathy
data(nw.atlantic)
atl <- as.bathy(nw.atlantic)

# plot with base graphics
plot(atl, image=TRUE)

# using the etopo color scale
etopo_cols <- rev(etopo.colors(8))
plot(atl, image=TRUE, bpal=list(
  c(min(atl), 0, etopo_cols[1:2]),
  c(0, max(atl), etopo_cols[3:8])
))


# plot using ggplot2; in which case the limits of the scale are automatic
library("ggplot2")
ggplot(atl, aes(x=x, y=y)) + coord_quickmap() +
  # background
  geom_raster(aes(fill=z)) +
  scale_fill_etopo() +
  # countours
  geom_contour(aes(z=z),
    breaks=c(0, -100, -200, -500, -1000, -2000, -4000),
    colour="black", size=0.2
  ) +
  scale_x_continuous(expand=c(0,0)) +
  scale_y_continuous(expand=c(0,0))




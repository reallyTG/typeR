library(ggplot2)


### Name: geom_density_2d
### Title: Contours of a 2d density estimate
### Aliases: geom_density_2d geom_density2d stat_density_2d stat_density2d

### ** Examples

m <- ggplot(faithful, aes(x = eruptions, y = waiting)) +
 geom_point() +
 xlim(0.5, 6) +
 ylim(40, 110)
m + geom_density_2d()
## No test: 
m + stat_density_2d(aes(fill = stat(level)), geom = "polygon")

set.seed(4393)
dsmall <- diamonds[sample(nrow(diamonds), 1000), ]
d <- ggplot(dsmall, aes(x, y))
# If you map an aesthetic to a categorical variable, you will get a
# set of contours for each value of that variable
d + geom_density_2d(aes(colour = cut))

# Similarly, if you apply faceting to the plot, contours will be
# drawn for each facet, but the levels will calculated across all facets
d + stat_density_2d(aes(fill = stat(level)), geom = "polygon") +
  facet_grid(. ~ cut) + scale_fill_viridis_c()
# To override this behavior (for instace, to better visualize the density
# within each facet), use stat(nlevel)
d + stat_density_2d(aes(fill = stat(nlevel)), geom = "polygon") +
  facet_grid(. ~ cut) + scale_fill_viridis_c()

# If we turn contouring off, we can use use geoms like tiles:
d + stat_density_2d(geom = "raster", aes(fill = stat(density)), contour = FALSE)
# Or points:
d + stat_density_2d(geom = "point", aes(size = stat(density)), n = 20, contour = FALSE)
## End(No test)




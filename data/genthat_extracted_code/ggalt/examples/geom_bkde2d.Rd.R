library(ggalt)


### Name: geom_bkde2d
### Title: Contours from a 2d density estimate.
### Aliases: geom_bkde2d stat_bkde2d

### ** Examples

m <- ggplot(faithful, aes(x = eruptions, y = waiting)) +
       geom_point() +
       xlim(0.5, 6) +
       ylim(40, 110)

m + geom_bkde2d(bandwidth=c(0.5, 4))

m + stat_bkde2d(bandwidth=c(0.5, 4), aes(fill = ..level..), geom = "polygon")

# If you map an aesthetic to a categorical variable, you will get a
# set of contours for each value of that variable
set.seed(4393)
dsmall <- diamonds[sample(nrow(diamonds), 1000), ]
d <- ggplot(dsmall, aes(x, y)) +
       geom_bkde2d(bandwidth=c(0.5, 0.5), aes(colour = cut))
d

# If we turn contouring off, we can use use geoms like tiles:
d + stat_bkde2d(bandwidth=c(0.5, 0.5), geom = "raster",
                aes(fill = ..density..), contour = FALSE)

# Or points:
d + stat_bkde2d(bandwidth=c(0.5, 0.5), geom = "point",
                aes(size = ..density..),  contour = FALSE)




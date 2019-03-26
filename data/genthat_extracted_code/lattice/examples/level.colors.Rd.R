library(lattice)


### Name: D_level.colors
### Title: A function to compute false colors representing a numeric or
###   categorical variable
### Aliases: level.colors
### Keywords: utilities

### ** Examples


depth.col <-
    with(quakes, 
         level.colors(depth, at = do.breaks(range(depth), 30),
                      col.regions = terrain.colors))


xyplot(lat ~ long | equal.count(stations), quakes,
       strip = strip.custom(var.name = "Stations"),
       colours = depth.col,
       panel = function(x, y, colours, subscripts, ...) {
           panel.xyplot(x, y, pch = 21, col = "transparent",
                        fill = colours[subscripts], ...)
       })





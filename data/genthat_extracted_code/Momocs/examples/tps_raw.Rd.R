library(Momocs)


### Name: tps_raw
### Title: Vanilla Thin Plate Splines
### Aliases: tps_raw

### ** Examples

## Not run: 
##D ms <- mshapes(efourier(bot, 10), "type")
##D b <- ms$shp$beer
##D w <- ms$shp$whisky
##D g <- tps_raw(b, w)
##D ldk_plot(g$grid)
##D 
##D # a wavy plot
##D ldk_plot(g$grid, pch=NA)
##D cols_ids <- 1:g$dim[1]
##D for (i in 1:g$dim[2]) lines(g$grid[cols_ids + (i-1)*g$dim[1], ])
## End(Not run)




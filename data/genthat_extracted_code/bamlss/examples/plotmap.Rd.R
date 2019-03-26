library(bamlss)


### Name: plotmap
### Title: Plot Maps
### Aliases: plotmap
### Keywords: hplot

### ** Examples

## Example from mgcv ?mrf.
## Load Columbus Ohio crime data (see ?columbus for details and credits).
data("columb", package = "mgcv")
data("columb.polys", package = "mgcv")

## Plot the map.
plotmap(columb.polys)

## Plot aggregated data.
a <- with(columb, aggregate(crime,
  by = list("district" = district), FUN = mean))

plotmap(columb.polys, x = a$x, id = a$district)
plotmap(columb.polys, x = a$x, id = a$district,
  pos = "topleft")
plotmap(columb.polys, x = a$x, id = a$district,
  pos = "topleft", side.legend = 2)
plotmap(columb.polys, x = a$x, id = a$district,
  pos = "topleft", side.legend = 2, side.ticks = 2)
plotmap(columb.polys, x = a$x, id = a$district,
  pos = "topleft", side.legend = 2, side.ticks = 2,
  col = heat_hcl, swap = TRUE)
plotmap(columb.polys, x = a$x, id = a$district,
  pos = "topleft", side.legend = 2, side.ticks = 2,
  col = heat_hcl, swap = TRUE, range = c(10, 50))
plotmap(columb.polys, x = a$x, id = a$district,
  pos = "topleft", side.legend = 2, side.ticks = 2,
  col = heat_hcl(5), swap = TRUE, range = c(10, 50),
  lrange = c(0, 60))




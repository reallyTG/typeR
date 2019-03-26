library(Momocs)


### Name: tps_grid
### Title: Deformation grids using Thin Plate Splines
### Aliases: tps_grid

### ** Examples

botF <- efourier(bot)
x <- mshapes(botF, 'type', nb.pts=80)$shp
fr <- x$beer
to <- x$whisky
tps_grid(fr, to, amp=3, grid.size=10)




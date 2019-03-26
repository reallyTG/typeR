library(Momocs)


### Name: tps_arr
### Title: Deformation 'vector field' using Thin Plate Splines
### Aliases: tps_arr

### ** Examples

botF <- efourier(bot)
x <- mshapes(botF, 'type', nb.pts=80)$shp
fr <- x$beer
to <- x$whisky
tps_arr(fr, to, arr.nb=200, palette=col_sari, amp=3)
tps_arr(fr, to, arr.nb=200, palette=col_sari, amp=3, grid=FALSE)




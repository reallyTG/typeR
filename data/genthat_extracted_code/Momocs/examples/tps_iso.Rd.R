library(Momocs)


### Name: tps_iso
### Title: Deformation isolines using Thin Plate Splines.
### Aliases: tps_iso

### ** Examples

botF <- efourier(bot)
x <- mshapes(botF, 'type', nb.pts=80)$shp
fr <- x$beer
to <- x$whisky
tps_iso(fr, to, iso.nb=200, amp=3)
tps_iso(fr, to, iso.nb=200, amp=3, grid=TRUE)




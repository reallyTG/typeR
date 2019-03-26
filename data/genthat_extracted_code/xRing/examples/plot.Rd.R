library(xRing)


### Name: plot
### Title: Plot xRing and xRingList Objects
### Aliases: plot plot.xRing plot plot.xRingList

### ** Examples


 data(PaPiRaw)
 data(PaPiSpan)

 PaPi <- detectRings(PaPiRaw, PaPiSpan)
 class(PaPi)

 PaPiRings <- detectEwLw(PaPi, ew = 0.5)
 plot(PaPiRings, series = "AFO1001a")

 PaPiRings1 <- detectEwLw(PaPi, ew = 0.35, lw = 0.55)
 plot(PaPiRings1, series = "AFO1001a")

 plot(PaPiRings, series = "AFO1001a", years = c(1990,2000))
 plot(PaPiRings$AFO1001a)
 






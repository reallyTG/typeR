library(xRing)


### Name: plotRings
### Title: Plot xRing Objects
### Aliases: plotRings

### ** Examples

if(interactive()){
 data(PaPiRaw)
 data(PaPiSpan)

 PaPi <- detectRings(PaPiRaw[,1, drop = FALSE], PaPiSpan)
 plotRings(PaPi$AFO1001a)
 plotRings(PaPi, series="AFO1001a")
 plotRings(PaPi, series="AFO1001a", xlim = c(120,450))

 PaPi1 <- detectEwLw(PaPi, ew = 0.5)
 plotRings(PaPi1, series = "AFO1001a", EwLw = FALSE)
 plotRings(PaPi1, series = "AFO1001a")
}




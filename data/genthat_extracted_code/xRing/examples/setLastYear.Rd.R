library(xRing)


### Name: setLastYear
### Title: Set Last Year
### Aliases: setLastYear

### ** Examples


 data(PaPiRaw)
 data(PaPiSpan)
 PaPi <- detectRings(PaPiRaw, PaPiSpan)
 plot(PaPi, series = "AFO1001b")
 PaPi <- setLastYear(PaPi, 2005, series = "AFO1001b")
 plot(PaPi, series = "AFO1001b")





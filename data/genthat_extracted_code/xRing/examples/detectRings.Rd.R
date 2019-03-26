library(xRing)


### Name: detectRings
### Title: Detect Tree-Ring Borders
### Aliases: detectRings

### ** Examples


 data(PaPiRaw)
 data(PaPiSpan)
 PaPi <- toxRingList(PaPiRaw, PaPiSpan)
 PaPi <- detectRings(PaPi)
 # give the same
 PaPi <- detectRings(PaPiRaw, PaPiSpan)
 # Because the last year is not supplied the last year for all series is the last calendar year
 # as.numeric(format(Sys.time(), "%Y"))-1
 PaPi <- detectRings(PaPiRaw)





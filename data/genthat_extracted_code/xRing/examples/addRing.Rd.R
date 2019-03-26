library(xRing)


### Name: addRing
### Title: Add Tree-Ring Border(s)
### Aliases: addRing

### ** Examples


 data(PaPiRaw)
 data(PaPiSpan)
 PaPi <- detectRings(PaPiRaw, PaPiSpan)
 plot(PaPi$'AFO1001a')
 PaPi$AFO1001a <- removeRing(PaPi$AFO1001a, 47)
 plot(PaPi$'AFO1001a')
 PaPi <- addRing(PaPi, series = 'AFO1001a', x = 47)
 plot(PaPi$'AFO1001a')






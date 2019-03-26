library(xRing)


### Name: removeRing
### Title: Remove Tree-Ring Border(s)
### Aliases: removeRing

### ** Examples

 data(PaPiRaw)
 data(PaPiSpan)
 PaPi <- detectRings(PaPiRaw, PaPiSpan)
 plotRings(PaPi$AFO1001a)
 abline(v = 60, lty = 2, col = 2) 
 PaPi$AFO1001a <- removeRing(PaPi$AFO1001a, x = 60)
 # PaPi$AFO1001a <- removeRing(PaPi$AFO1001a, x = locator(1)$x)
 plotRings(PaPi$AFO1001a)





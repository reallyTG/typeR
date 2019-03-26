library(xRing)


### Name: detectEwLw
### Title: Detect the Transition from Earlywood to Latewood
### Aliases: detectEwLw

### ** Examples


 data(PaPiRaw)
 data(PaPiSpan)
 PaPi <- detectRings(PaPiRaw, PaPiSpan)
 PaPi.merge <- combineFrag(PaPi, frag = 9)
 PaPiRings <- detectEwLw(PaPi.merge, ew = 0.5)





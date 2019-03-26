library(xRing)


### Name: getDensity
### Title: Get Density Values
### Aliases: getDensity

### ** Examples


 data(PaPiRaw)
 data(PaPiSpan)
 PaPi <- detectRings(PaPiRaw, PaPiSpan)
 PaPi.merge <- combineFrag(PaPi, frag = 9)
 PaPiRings <- detectEwLw(PaPi.merge, ew = 0.5)

 PaPi <- detectRings(PaPiRaw, PaPiSpan)
 PaPiRings <- detectEwLw(PaPi, ew = 0.5)

 # xRingList object
 PaPiDen <- getDensity(PaPiRings)

 PaPiDen$AFO1001a[]
 PaPiDen$AFO1001a$density

 # xRing object
 PaPi_AFO1001a <- getDensity(PaPi$AFO1001a)
 #the same
 PaPi_1 <- getDensity(PaPi[[1]])
 identical(PaPi_AFO1001a , PaPi_1)

 # do not work for PaPi[1]
 # class(PaPi[1])
 # getDensity(PaPi[1]) # 'list' class







library(xRing)


### Name: getRwls
### Title: Get Data-Frames With Ring Width and Density Values
### Aliases: getRwls

### ** Examples


 data(PaPiRaw)
 data(PaPiSpan)
 PaPi <- detectRings(PaPiRaw, PaPiSpan)
 PaPi <- combineFrag(PaPi)
 PaPi <- detectEwLw(PaPi)
 rwls <- getRwls(PaPi)
 names(rwls)
 library(dplR)
 rwl.report(rwls$trw)
 library(detrendeR)
 RwlInfo(rwls$trw)
 




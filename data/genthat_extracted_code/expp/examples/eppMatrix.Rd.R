library(expp)


### Name: eppMatrix-class
### Title: Convert a 'data.frame' to an eppMatrix object.
### Aliases: eppMatrix-class eppMatrix

### ** Examples


eppPairs = data.frame(male = c("m1", "m2", "m1"), female=c("f3", "f1", "f2") )
e = eppMatrix(eppPairs,  pairs = ~ male + female)
class(e)
showClass("eppMatrix")

data(bluetit_breeding)
data(bluetit_epp)
b = bluetit_breeding[bluetit_breeding$year_ == 2010, ]
eppPairs = bluetit_epp[bluetit_epp$year_ == 2010, ]

breedingDat  = SpatialPointsBreeding(b, id = 'id', coords = ~ x + y, breeding = ~ male + female)
eppDat = eppMatrix(eppPairs, pairs = ~ male + female)

plot(breedingDat, eppDat)





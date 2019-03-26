library(poppr)


### Name: nei.dist
### Title: Calculate Genetic Distance for a genind or genclone object.
### Aliases: nei.dist edwards.dist rogers.dist reynolds.dist provesti.dist
###   prevosti.dist
### Keywords: angular coancestry edwards nei provesti reynolds rodgers
###   rogers

### ** Examples


data(nancycats)
(nan9   <- popsub(nancycats, 9))
(neinan <- nei.dist(nan9))
(ednan  <- edwards.dist(nan9))
(rodnan <- rogers.dist(nan9))
(reynan <- reynolds.dist(nan9))
(pronan <- prevosti.dist(nan9))





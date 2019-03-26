library(PlayerRatings)


### Name: steph
### Title: The Stephenson Rating System
### Aliases: steph
### Keywords: models

### ** Examples

afl <- aflodds[,c(2,3,4,7)]
robj <- steph(afl)
robj

robj <- steph(afl[afl$Week==1,])
for(i in 2:max(afl$Week)) robj <- steph(afl[afl$Week==i,], robj$ratings)
robj




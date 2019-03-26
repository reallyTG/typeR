library(PlayerRatings)


### Name: fide
### Title: The Elo Rating System Employed By The FIDE
### Aliases: fide
### Keywords: models

### ** Examples

afl <- aflodds[,c(2,3,4,7)]
robj <- fide(afl)
robj

robj <- fide(afl[afl$Week==1,])
for(i in 2:max(afl$Week)) robj <- fide(afl[afl$Week==i,], robj$ratings)
robj




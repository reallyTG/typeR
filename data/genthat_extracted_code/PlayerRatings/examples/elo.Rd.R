library(PlayerRatings)


### Name: elo
### Title: The Elo Rating System
### Aliases: elo print.rating summary.rating
### Keywords: models

### ** Examples

afl <- aflodds[,c(2,3,4,7)]
robj <- elo(afl)
robj

robj <- elo(afl[afl$Week==1,])
for(i in 2:max(afl$Week)) robj <- elo(afl[afl$Week==i,], robj$ratings)
robj




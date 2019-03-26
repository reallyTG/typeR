library(PlayerRatings)


### Name: glicko
### Title: The Glicko Rating System
### Aliases: glicko
### Keywords: models

### ** Examples

afl <- aflodds[,c(2,3,4,7)]
robj <- glicko(afl)
robj

robj <- glicko(afl[afl$Week==1,])
for(i in 2:max(afl$Week)) robj <- glicko(afl[afl$Week==i,], robj$ratings)
robj




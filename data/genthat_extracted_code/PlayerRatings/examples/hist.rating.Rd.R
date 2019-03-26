library(PlayerRatings)


### Name: hist.rating
### Title: Histogram Plotting for a Rating Object
### Aliases: hist.rating
### Keywords: hplot

### ** Examples

afl <- aflodds[,c(2,3,4,7)]
robj <- steph(afl)
hist(robj, xlim = c(1900,2500), density=TRUE)

afl <- aflodds[,c(2,3,4,7)]
robj <- steph(afl, history=TRUE)
hist(robj, history=TRUE, xlim = c(1900,2500), density=TRUE)




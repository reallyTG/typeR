library(TDMR)


### Name: makeTdmRandomSeed
### Title: Factory method to make a function generating pseudo-random
###   random number seeds.
### Aliases: makeTdmRandomSeed
### Keywords: internal

### ** Examples


tdmRandomSeed = makeTdmRandomSeed();
for (i in 1:10) print(c(as.integer(Sys.time()), tdmRandomSeed()));





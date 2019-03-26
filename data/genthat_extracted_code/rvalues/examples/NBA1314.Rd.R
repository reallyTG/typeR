library(rvalues)


### Name: NBA1314
### Title: National Basketball Association, free throw data, 2013-2014
###   season
### Aliases: NBA1314
### Keywords: datasets

### ** Examples

data(NBA1314)
nba.dat <- cbind(NBA1314$FTM, NBA1314$FTA)
rownames(nba.dat) <- NBA1314$PLAYER

rvals.nba <- rvalues(nba.dat, family=binomial)




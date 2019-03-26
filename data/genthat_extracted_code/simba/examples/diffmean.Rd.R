library(simba)


### Name: diffmean
### Title: Calculate the difference in Mean between two vectors
### Aliases: diffmean plot.dmn
### Keywords: methods univar

### ** Examples


data(abis)

## create subsetting vector describing the belonging to different
## vegetationtypes
tcs.sub <- rep(0, 61)
tcs.sub[abis.env[,29]==1] <- 1
tcs.sub[abis.env[,30]==1] <- 2
tcs.sub[abis.env[,31]==1] <- 3

## check distribution
summary(as.factor(tcs.sub))

## compare vegetation types "shrubby vegetation" (shrub=2) and
## "protected by snowcover" (protect=3) regarding difference in 
## similarities
abis2.soer <- sim(abis.spec[tcs.sub==2,])
abis3.soer <- sim(abis.spec[tcs.sub==3,])
abis.23cmp <- diffmean(abis2.soer, abis3.soer)





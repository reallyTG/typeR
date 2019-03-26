library(RCMIP5)


### Name: makeZStat
### Title: Compute Z-dimension statistic of a variable
### Aliases: makeZStat

### ** Examples

d <- cmip5data(1970:1975, Z=TRUE)   # sample data
makeZStat(d)
summary(makeZStat(d, FUN=sd))




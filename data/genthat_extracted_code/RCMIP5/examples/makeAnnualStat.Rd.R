library(RCMIP5)


### Name: makeAnnualStat
### Title: Compute annual statistic of a variable
### Aliases: makeAnnualStat

### ** Examples

d <- cmip5data(1970:1975)   # sample data
makeAnnualStat(d)
summary(makeAnnualStat(d))
summary(makeAnnualStat(d, FUN=sd))




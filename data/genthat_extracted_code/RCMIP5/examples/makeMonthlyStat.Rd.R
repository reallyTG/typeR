library(RCMIP5)


### Name: makeMonthlyStat
### Title: Compute monthly statistic of a variable
### Aliases: makeMonthlyStat

### ** Examples

d <- cmip5data(1970:1975)   # sample data
makeMonthlyStat(d)
summary(makeMonthlyStat(d))
summary(makeMonthlyStat(d, FUN=sd))




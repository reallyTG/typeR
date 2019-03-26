library(redlistr)


### Name: extrapolateEstimate
### Title: Extrapolate Estimate
### Aliases: extrapolateEstimate

### ** Examples

a.r1 <- 23.55
a.r2 <- 15.79
decline.stats <- getDeclineStats(a.r1, a.r2, year.t1 = 1990, year.t2 = 2012,
                                 methods = 'PRD')
a.2040.PRD <- extrapolateEstimate(a.r1, a.r2, year.t1 = 1990, nYears = 50,
                                  PRD = decline.stats$PRD)




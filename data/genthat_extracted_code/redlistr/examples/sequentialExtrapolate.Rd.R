library(redlistr)


### Name: sequentialExtrapolate
### Title: Sequential extrapolation estimate
### Aliases: sequentialExtrapolate

### ** Examples

a.r1 <- 23.55
a.r2 <- 15.79
decline.stats <- getDeclineStats(a.r1, a.r2, year.t1 = 1990, year.t2 = 2012,
                                 methods = 'PRD')
a.2040.PRD.seq <- sequentialExtrapolate(a.r1, a.r2, year.t1 = 1990, nYears = 50,
                                        PRD = decline.stats$PRD)




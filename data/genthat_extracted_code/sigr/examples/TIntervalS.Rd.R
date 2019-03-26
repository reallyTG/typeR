library(sigr)


### Name: TIntervalS
### Title: Student-T tolerance-style interval around an estimate of a mean
###   from summary.
### Aliases: TIntervalS

### ** Examples


set.seed(2018)
d <- rnorm(100) + 3.2
TIntervalS(length(d), mean(d), stats::var(d))





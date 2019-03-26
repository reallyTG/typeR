library(sigr)


### Name: TInterval.data.frame
### Title: Student-T tolerance-style interval around an estimate of a mean
###   from a data.frame.
### Aliases: TInterval.data.frame

### ** Examples


set.seed(2018)
d <- data.frame(x = rnorm(100) + 3.2)
TInterval(d, "x")






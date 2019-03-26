library(metansue)


### Name: leave1out
### Title: Compute Leave-One-Out Diagnostics for "nsue" Objects
### Aliases: leave1out leave1out.nsue print.leave1out.nsue
###   summary.leave1out.nsue
### Keywords: jackknife leave1out meta-analysis

### ** Examples

t <- c(3.4, NA, NA, NA, NA, 2.8, 2.1, 3.1, 2.0, 3.4)
n <- c(40, 20, 22, 24, 18, 30, 25, 30, 16, 22)
leave1out(smc_from_t(t, n))




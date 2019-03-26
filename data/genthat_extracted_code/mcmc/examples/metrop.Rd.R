library(mcmc)


### Name: metrop
### Title: Metropolis Algorithm
### Aliases: metrop metrop.function metrop.metropolis
### Keywords: misc

### ** Examples

h <- function(x) if (all(x >= 0) && sum(x) <= 1) return(1) else return(-Inf)
out <- metrop(h, rep(0, 5), 1000)
out$accept
# acceptance rate too low
out <- metrop(out, scale = 0.1)
out$accept
t.test(out$accept.batch)$conf.int
# acceptance rate o. k. (about 25 percent)
plot(out$batch[ , 1])
# but run length too short (few excursions from end to end of range)
out <- metrop(out, nbatch = 1e4)
out$accept
plot(out$batch[ , 1])
hist(out$batch[ , 1])
acf(out$batch[ , 1], lag.max = 250)
# looks like batch length of 250 is perhaps OK
out <- metrop(out, blen = 250, nbatch = 100)
apply(out$batch, 2, mean) # Monte Carlo estimates of means
apply(out$batch, 2, sd) / sqrt(out$nbatch) # Monte Carlo standard errors
t.test(out$accept.batch)$conf.int
acf(out$batch[ , 1]) # appears that blen is long enough




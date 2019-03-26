library(valuer)


### Name: payoff_ratchet
### Title: Ratchet payoff class
### Aliases: payoff_ratchet
### Keywords: datasets

### ** Examples

freq <- "1m"
premium <- 100
ratchet <- payoff_ratchet$new(premium, freq)
t1 <- timeDate::timeDate("2016-01-01")
t2 <- timeDate::timeDate("2016-12-31")
account <- 120 * rnorm(365)
ratchet$get_payoff(c(120,100), c(t1,t2), account)




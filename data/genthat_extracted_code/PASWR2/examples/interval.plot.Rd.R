library(PASWR2)


### Name: interval.plot
### Title: Interval Plot
### Aliases: interval.plot
### Keywords: programming

### ** Examples

set.seed(385)
samples <- 100
n <- 625
ll <- numeric(samples)
ul <- numeric(samples)
xbar <- numeric(samples)
for (i in 1:samples){
  xbar[i] <- mean(rnorm(n, 80, 25))
  ll[i] <- xbar[i] - qnorm(.975)*25/sqrt(n)
  ul[i] <- xbar[i] + qnorm(.975)*25/sqrt(n)
  }
interval.plot(ll, ul, parameter = 80)





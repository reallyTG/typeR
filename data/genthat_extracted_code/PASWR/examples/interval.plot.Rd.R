library(PASWR)


### Name: interval.plot
### Title: Interval Plot
### Aliases: interval.plot
### Keywords: misc

### ** Examples

set.seed(402)
m <- 100 # Number of samples
n <- 500 # Sample size
a <- array(0,m)
ll <- array(0,m)
ul <- array(0,m)
i <- 0
while (i < m)
{ i <- i + 1
a[i] <- mean(rnorm(n))
ll[i] <- a[i] + qnorm(0.025)*sqrt(1/n)
ul[i] <- a[i] + qnorm(0.975)*sqrt(1/n)
}
interval.plot(ll,ul)




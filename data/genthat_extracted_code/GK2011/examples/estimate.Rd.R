library(GK2011)


### Name: estimate
### Title: estimate
### Aliases: estimate

### ** Examples

# create fake data
set.seed(12345)
d <- 
data.frame(rand = c(rep(1, 200), rep(0, 100)),
           tr = c(rep(0, 100), rep(1, 100), rep(0, 37), rep(1, 63)),
           y = c(rnorm(100), rnorm(100) + 1, rnorm(37), rnorm(63) + 3))

# estimate effects
estimate(rand = d$rand, tr = d$tr, y = d$y)




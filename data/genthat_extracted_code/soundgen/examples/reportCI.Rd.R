library(soundgen)


### Name: reportCI
### Title: Report CI
### Aliases: reportCI
### Keywords: internal

### ** Examples

n = rnorm(100)
soundgen:::reportCI(quantile(n, probs = c(.5, .025, .975)))

a = data.frame(fit = c(3, 5, 7),
               lwr = c(1, 4, 6.5),
               upr = c(5, 6, 7.1))
soundgen:::reportCI(a, 1)




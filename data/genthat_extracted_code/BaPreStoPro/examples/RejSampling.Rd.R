library(BaPreStoPro)


### Name: RejSampling
### Title: Rejection Sampling Algorithm
### Aliases: RejSampling

### ** Examples

plot(density(RejSampling(dens = function(x) dnorm(x, 5, 1),
   len = 500, cand = seq(2, 9, by = 0.001), method = "free")))
lines(density(RejSampling(dens = function(x) dnorm(x, 5, 1), len = 500,
      cand = seq(2, 9, by = 0.001), method = "vector")), col=2)
curve(dnorm(x, 5, 1), from = 2, to = 8, add = TRUE, col = 3)




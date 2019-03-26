library(gridsampler)


### Name: calc_probabilities
### Title: Probability for certain degree of saturation
### Aliases: calc_probabilities

### ** Examples

prob <-  dexp(1:30, .05)
n <- seq(10, 80, by = 20)
r <- sim_n_persons_x_times_many_n(prob, n, a = 7, times = 100)
dd <- calc_probabilities(r, n, ms=1:5, min.props = c(0.9, .95, 1))
head(dd)





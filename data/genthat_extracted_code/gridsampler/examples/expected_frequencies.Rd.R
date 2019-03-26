library(gridsampler)


### Name: expected_frequencies
### Title: Produce ggplot of percentiles for simulated frequencies
### Aliases: expected_frequencies

### ** Examples

r <- sim_n_persons_x_times(dexp(1:30, rate = .05), n = 50, a = 5:7, ap = 1:3, 100)
expected_frequencies(r)





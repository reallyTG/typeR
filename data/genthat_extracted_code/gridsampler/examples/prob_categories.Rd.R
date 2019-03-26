library(gridsampler)


### Name: prob_categories
### Title: Probability for certain degree of saturation
### Aliases: prob_categories

### ** Examples

r <- sim_n_persons_x_times(dexp(1:30, rate = .05), n = 50, a = 5:7, times = 100, progress = "none")
prob_categories(r, 4, min.prop = .9)





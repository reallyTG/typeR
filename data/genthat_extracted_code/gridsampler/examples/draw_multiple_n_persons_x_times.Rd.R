library(gridsampler)


### Name: draw_multiple_n_persons_x_times
### Title: Draw and redraw results of simulation
### Aliases: draw_multiple_n_persons_x_times

### ** Examples

## simulate
prob <-  dexp(1:30, .05)      # probabilities for categories
N <- seq(10, 80, by = 10)     # smaple sizes to simulate
r <- sim_n_persons_x_times_many_n(prob, n = N, a = 7, times = 100, progress = "none")

# calculate and draw
M <- 1:5                      # minimal number of categories to evaluate
p <- c(0.9, .95, 1)           # proportion of categories for which minimal m holds
d <- calc_probabilities(r, n = N, ms = M, min.props = p)
draw_multiple_n_persons_x_times(d)




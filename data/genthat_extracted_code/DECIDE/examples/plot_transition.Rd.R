library(DECIDE)


### Name: plot_transition
### Title: Plot distributions of performance and transition propensities
### Aliases: plot_transition

### ** Examples

# generate a dataset
set.seed(1)
data <- data.frame(seq(1:10), rep(c(1, 2), length.out = 10), 
c(rep(0, times = 3), rep(1, times = 7)), 
c(rnorm(4, 0, 1), rnorm(4, 0.5, 1), NA, NA))

# run function
plot_transition(data)




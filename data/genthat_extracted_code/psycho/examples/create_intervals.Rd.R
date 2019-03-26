library(psycho)


### Name: create_intervals
### Title: Overlap of Two Empirical Distributions.
### Aliases: create_intervals

### ** Examples

library(psycho)

x <- rnorm(100, 0, 1)

create_intervals(x, n = 4)
create_intervals(x, n = 4, equal_range = FALSE)
create_intervals(x, length = 1)

create_intervals(x, n = 4, labels = "median")
create_intervals(x, n = 4, labels = FALSE)




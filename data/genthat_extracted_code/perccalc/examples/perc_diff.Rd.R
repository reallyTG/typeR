library(perccalc)


### Name: perc_diff
### Title: Calculate percentile differences from an ordered categorical
###   variable and a continuous variable.
### Aliases: perc_diff

### ** Examples


library(dplyr)

set.seed(23131)
N <- 1000
K <- 20

toy_data <- tibble::tibble(id = 1:N,
score = rnorm(N, sd = 2),
type = rep(paste0("inc", 1:20), each = N/K),
wt = 1)

# perc_diff(toy_data, type, score)
# type is not an ordered factor!

toy_data <-
toy_data %>%
mutate(type = factor(type, levels = unique(type), ordered = TRUE))


perc_diff(toy_data, type, score, percentiles = c(90, 10))
perc_diff(toy_data, type, score, percentiles = c(50, 10))

perc_diff(toy_data, type, score, weights = wt, percentiles = c(30, 10))





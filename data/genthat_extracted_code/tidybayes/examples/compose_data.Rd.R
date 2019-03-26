library(tidybayes)


### Name: compose_data
### Title: Compose data for input into a Bayesian model
### Aliases: compose_data
### Keywords: manip

### ** Examples


library(magrittr)

df = data.frame(
  plot = factor(paste0("p", rep(1:8, times = 2))),
  site = factor(paste0("s", rep(1:4, each = 2, times = 2)))
)

# without changing `.n_name`, compose_data() will prefix indices
# with "n" by default
df %>%
  compose_data()

# you can use n_prefix() to define a different prefix (e.g. "N"):
df %>%
  compose_data(.n_name = n_prefix("N"))

# If you have nesting, you may want a nested index, which can be generated using x_at_y()
# Here, site[p] will give the site for plot p
df %>%
  compose_data(site = x_at_y(site, plot))





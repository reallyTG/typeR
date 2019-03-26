library(tidybayes)


### Name: x_at_y
### Title: Generate lookup vectors for composing nested indices
### Aliases: x_at_y

### ** Examples


library(magrittr)

df = data.frame(
  plot = factor(paste0("p", rep(1:8, times = 2))),
  site = factor(paste0("s", rep(1:4, each = 2, times = 2)))
)

# turns site into a nested index: site[p] gives the site for plot p
df %>%
  compose_data(site = x_at_y(site, plot))





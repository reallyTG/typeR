library(ggforce)


### Name: facet_grid_paginate
### Title: Split facet_grid over multiple plots
### Aliases: facet_grid_paginate

### ** Examples

# Draw a small section of the grid
ggplot(diamonds) +
  geom_point(aes(carat, price), alpha = 0.1) +
  facet_grid_paginate(color ~ cut:clarity, ncol = 3, nrow = 3, page = 4)




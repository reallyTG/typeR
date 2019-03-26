library(ggforce)


### Name: n_pages
### Title: Determine the number of pages in a paginated facet plot
### Aliases: n_pages

### ** Examples

p <- ggplot(diamonds) +
  geom_point(aes(carat, price), alpha = 0.1) +
  facet_wrap_paginate(~ cut:clarity, ncol = 3, nrow = 3, page = 1)
n_pages(p)




library(ggvis)


### Name: compute_tabulate
### Title: Count data at each location of a categorical variable
### Aliases: compute_tabulate

### ** Examples

library(dplyr)
# The tabulated column must be countable (not numeric)
## Not run: mtcars %>% compute_tabulate(~cyl)
mtcars %>% mutate(cyl = factor(cyl)) %>% compute_tabulate(~cyl)

# Or equivalently:
mtcars %>% compute_tabulate(~factor(cyl))

# If there's one weight value at each x, it effectively just renames columns.
pressure %>% compute_tabulate(~factor(temperature), ~pressure)

# It doesn't matter whether you transform inside or outside of a vis
mtcars %>% compute_tabulate(~factor(cyl)) %>%
  ggvis(x = ~x_, y = ~count_, y2 = 0) %>%
  layer_rects(width = band())

mtcars %>%
  ggvis(x = ~x_, y = ~count_, y2 = 0) %>%
  compute_tabulate(~factor(cyl)) %>%
  layer_rects(width = band())

# compute_tabulate is used automatically in layer_bars when no y prop
# is supplied.
mtcars %>% ggvis(x = ~factor(cyl)) %>% layer_bars()




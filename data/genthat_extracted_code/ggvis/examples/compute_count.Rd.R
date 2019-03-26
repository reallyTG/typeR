library(ggvis)


### Name: compute_count
### Title: Count data at each location
### Aliases: compute_count

### ** Examples

mtcars %>% compute_count(~cyl)

# Weight the counts by car weight value
mtcars %>% compute_count(~cyl, ~wt)

# If there's one weight value at each x, it effectively just renames columns.
pressure %>% compute_count(~temperature, ~pressure)
# Also get the width of each bin
pressure %>% compute_count(~temperature, ~pressure) %>% compute_align(~x_)

# It doesn't matter whether you transform inside or outside of a vis
mtcars %>% compute_count(~cyl, ~wt) %>%
  compute_align(~x_) %>%
  ggvis(x = ~xmin_, x2 = ~xmax_, y = ~count_, y2 = 0) %>%
  layer_rects()

mtcars %>%
  ggvis(x = ~xmin_, x2 = ~xmax_, y = ~count_, y2 = 0) %>%
  compute_count(~cyl, ~wt) %>%
  compute_align(~x_) %>%
  layer_rects()




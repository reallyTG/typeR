library(ggvis)


### Name: compute_align
### Title: Align positions using length.
### Aliases: compute_align

### ** Examples

mtcars %>% compute_count(~disp) %>% compute_align(~x_)
mtcars %>% compute_count(~mpg) %>% compute_align(~x_)

# Use a specific width
pressure %>% compute_count(~temperature) %>% compute_align(~x_)
pressure %>% compute_count(~temperature) %>% compute_align(~x_, length = 5)

# It doesn't matter whether you transform inside or outside of a vis
mtcars %>% compute_count(~cyl, ~wt) %>%
  compute_align(~x_, length = .5) %>%
  ggvis(x = ~xmin_, x2 = ~xmax_, y = ~count_, y2 = 0) %>%
  layer_rects()

mtcars %>%
  ggvis(x = ~xmin_, x2 = ~xmax_, y = ~count_, y2 = 0) %>%
  compute_count(~cyl, ~wt) %>%
  compute_align(~x_) %>%
  layer_rects()

# Varying align
mtcars %>%
  ggvis(x = ~xmin_, x2 = ~xmax_, y = ~count_, y2 = 0) %>%
  compute_count(~cyl, ~wt) %>%
  compute_align(~x_, length = 0.5, align = input_slider(0, 1)) %>%
  layer_rects()




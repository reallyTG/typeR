library(ggvis)


### Name: layer_histograms
### Title: Display binned data
### Aliases: layer_histograms layer_freqpolys

### ** Examples

# Create histograms and frequency polygons with layers
mtcars %>% ggvis(~mpg) %>% layer_histograms()
mtcars %>% ggvis(~mpg) %>% layer_histograms(width = 2)
mtcars %>% ggvis(~mpg) %>% layer_freqpolys(width = 2)

# These are equivalent to combining compute_bin with the corresponding
# mark
mtcars %>% compute_bin(~mpg) %>% ggvis(~x_, ~count_) %>% layer_paths()

# With grouping
mtcars %>% ggvis(~mpg, fill = ~factor(cyl)) %>% group_by(cyl) %>%
  layer_histograms(width = 2)
mtcars %>% ggvis(~mpg, stroke = ~factor(cyl)) %>% group_by(cyl) %>%
  layer_freqpolys(width = 2)




library(ggvis)


### Name: layer_lines
### Title: Layer lines on a plot.
### Aliases: layer_lines

### ** Examples

mtcars %>% ggvis(~wt, ~mpg, stroke = ~factor(cyl)) %>% layer_lines()

# Equivalent to
mtcars %>% ggvis(~wt, ~mpg, stroke = ~factor(cyl)) %>%
  group_by(cyl) %>% dplyr::arrange(wt) %>% layer_paths()




library(rbokeh)


### Name: ly_density
### Title: Add a "density" layer to a Bokeh figure
### Aliases: ly_density

### ** Examples

h <- figure(width = 600, height = 400) %>%
  ly_hist(eruptions, data = faithful, breaks = 40, freq = FALSE) %>%
  ly_density(eruptions, data = faithful)
h




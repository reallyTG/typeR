library(rbokeh)


### Name: ly_hist
### Title: Add a "hist" layer to a Bokeh figure
### Aliases: ly_hist

### ** Examples

h <- figure(width = 600, height = 400) %>%
  ly_hist(eruptions, data = faithful, breaks = 40, freq = FALSE) %>%
  ly_density(eruptions, data = faithful)
h




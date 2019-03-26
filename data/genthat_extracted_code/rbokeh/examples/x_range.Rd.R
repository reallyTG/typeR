library(rbokeh)


### Name: x_range
### Title: Update x axis range in a Bokeh figure
### Aliases: x_range

### ** Examples

## No test: 
# get data from Duluth site in 'barley' data
du <- subset(lattice::barley, site == "Duluth")

# plot with default ranges
p <- figure(width = 600) %>%
  ly_points(yield, variety, color = year, data = du)
p
# y axis is alphabetical

# manually set x and y axis (y in order of 1932 yield)
p %>%
  x_range(c(20, 40)) %>%
  y_range(du$variety[order(subset(du, year == 1932)$yield)])
## End(No test)




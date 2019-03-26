library(plotly)


### Name: add_trace
### Title: Add trace(s) to a plotly visualization
### Aliases: add_trace add_markers add_text add_paths add_lines
###   add_segments add_polygons add_sf add_table add_ribbons add_area
###   add_pie add_bars add_histogram add_histogram2d add_histogram2dcontour
###   add_heatmap add_contour add_boxplot add_surface add_mesh
###   add_scattergeo add_choropleth

### ** Examples


# the `plot_ly()` function initiates an object, and if no trace type
# is specified, it sets a sensible default
p <- plot_ly(economics, x = ~date, y = ~uempmed)
p

# some `add_*()` functions are a specific case of a trace type
# for example, `add_markers()` is a scatter trace with mode of markers
add_markers(p)

# scatter trace with mode of text
add_text(p, text = "%")

# scatter trace with mode of lines 
add_paths(p)

# like `add_paths()`, but ensures points are connected according to `x`
add_lines(p)

# if you prefer to work with plotly.js more directly, can always
# use `add_trace()` and specify the type yourself
add_trace(p, type = "scatter", mode = "markers+lines")

# mappings provided to `plot_ly()` are "global", but can be overwritten
plot_ly(economics, x = ~date, y = ~uempmed, color = I("red"), showlegend = FALSE) %>% 
  add_lines() %>%
  add_markers(color = ~pop)

# a number of `add_*()` functions are special cases of the scatter trace
plot_ly(economics, x = ~date) %>% 
  add_ribbons(ymin = ~pce - 1e3, ymax = ~pce + 1e3)

# use `group_by()` (or `group2NA()`) to apply visual mapping
# once per group (e.g. one line per group)
txhousing %>% 
  group_by(city) %>% 
  plot_ly(x = ~date, y = ~median) %>%
  add_lines(color = I("black"))

## Not run: 
##D # use `add_sf()` or `add_polygons()` to create geo-spatial maps
##D # http://blog.cpsievert.me/2018/03/30/visualizing-geo-spatial-data-with-sf-and-plotly/
##D if (requireNamespace("sf", quietly = TRUE)) {
##D   nc <- sf::st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)
##D   plot_ly() %>% add_sf(data = nc)
##D }
##D 
##D # univariate summary statistics
##D plot_ly(mtcars, x = ~factor(vs), y = ~mpg) %>% 
##D   add_boxplot()
##D plot_ly(mtcars, x = ~factor(vs), y = ~mpg) %>% 
##D   add_trace(type = "violin")
##D   
##D # `add_histogram()` does binning for you...
##D mtcars %>%
##D   plot_ly(x = ~factor(vs)) %>%
##D   add_histogram()
##D   
##D # ...but you can 'pre-compute' bar heights in R
##D mtcars %>%
##D   dplyr::count(vs) %>%
##D   plot_ly(x = ~vs, y = ~n) %>%
##D   add_bars()
##D 
##D # the 2d analogy of add_histogram() is add_histogram2d()/add_histogram2dcontour()
##D library(MASS)
##D (p <- plot_ly(geyser, x = ~waiting, y = ~duration))
##D add_histogram2d(p)
##D add_histogram2dcontour(p)
##D 
##D # the 2d analogy of add_bars() is add_heatmap()/add_contour()
##D # (i.e., bin counts must be pre-specified)
##D den <- kde2d(geyser$waiting, geyser$duration)
##D p <- plot_ly(x = den$x, y = den$y, z = den$z)
##D add_heatmap(p)
##D add_contour(p)
##D 
##D # `add_table()` makes it easy to map a data frame to the table trace type
##D plot_ly(economics) %>% 
##D   add_table()
##D 
##D # pie charts!
##D ds <- data.frame(labels = c("A", "B", "C"), values = c(10, 40, 60))
##D plot_ly(ds, labels = ~labels, values = ~values) %>%
##D   add_pie() %>%
##D   layout(title = "Basic Pie Chart using Plotly")
##D   
##D data(wind)
##D plot_ly(wind, r = ~r, t = ~t) %>% 
##D   add_area(color = ~nms) %>%
##D   layout(radialaxis = list(ticksuffix = "%"), orientation = 270)
##D 
##D # ------------------------------------------------------------
##D # 3D chart types
##D # ------------------------------------------------------------
##D plot_ly(z = ~volcano) %>% 
##D   add_surface()
##D plot_ly(x = c(0, 0, 1), y = c(0, 1, 0), z = c(0, 0, 0)) %>% 
##D   add_mesh()
## End(Not run)





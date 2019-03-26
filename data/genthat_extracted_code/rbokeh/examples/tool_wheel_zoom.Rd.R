library(rbokeh)


### Name: tool_wheel_zoom
### Title: Add "wheel_zoom" tool to a Bokeh figure
### Aliases: tool_wheel_zoom

### ** Examples

## No test: 
# only zoom on x axis
figure() %>% ly_points(1:10) %>%
 tool_wheel_zoom(dimensions = "height")
## End(No test)




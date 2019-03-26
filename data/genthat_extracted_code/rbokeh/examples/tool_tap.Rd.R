library(rbokeh)


### Name: tool_tap
### Title: Add "tap" tool to a Bokeh figure
### Aliases: tool_tap

### ** Examples

## No test: 
figure() %>%
  ly_points(1:10, lname = "points") %>%
  tool_tap(debug_callback("points"), "points")
## End(No test)




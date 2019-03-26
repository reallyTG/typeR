library(rbokeh)


### Name: tool_pan
### Title: Add "pan" tool to a Bokeh figure
### Aliases: tool_pan

### ** Examples

## No test: 
# only pan on x axis
figure() %>% ly_points(1:10) %>%
 tool_pan(dimensions = "height")
## End(No test)




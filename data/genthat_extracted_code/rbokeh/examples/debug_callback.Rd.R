library(rbokeh)


### Name: debug_callback
### Title: Specify a "debug" callback
### Aliases: debug_callback

### ** Examples

## No test: 
figure() %>%
  ly_points(1:10, lname = "points") %>%
  tool_tap(debug_callback("points"), "points")
## End(No test)




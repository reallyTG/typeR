library(rbokeh)


### Name: console_callback
### Title: Specify a console callback
### Aliases: console_callback

### ** Examples

## No test: 
figure() %>%
  ly_points(1:10) %>%
  x_range(callback = console_callback()) %>%
  y_range(callback = console_callback())
## End(No test)




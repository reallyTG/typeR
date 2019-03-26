library(corrr)


### Name: focus_if
### Title: Conditionally focus correlation data frame
### Aliases: focus_if

### ** Examples

library(dplyr)
any_greater_than <- function(x, val) {
  mean(abs(x), na.rm = TRUE) > val
}

x <- correlate(mtcars)

x %>% focus_if(any_greater_than, .6)
x %>% focus_if(any_greater_than, .6, mirror = TRUE) %>% network_plot()




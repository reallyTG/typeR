library(corrr)


### Name: fashion
### Title: Fashion a correlation data frame for printing.
### Aliases: fashion

### ** Examples

# Examples with correlate()
library(dplyr)
mtcars %>% correlate() %>% fashion()
mtcars %>% correlate() %>% fashion(decimals = 1)
mtcars %>% correlate() %>% fashion(leading_zeros = TRUE)
mtcars %>% correlate() %>% fashion(na_print = "*")

# But doesn't have to include correlate()
mtcars %>% fashion(decimals = 3)
c(0.234, 134.23, -.23, NA) %>% fashion(na_print = "X")




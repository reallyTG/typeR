library(tidytidbits)


### Name: format_numbers_at
### Title: Format numeric columns for display
### Aliases: format_numbers_at

### ** Examples

library(tibble)
library(magrittr)
library(dplyr)
tibble(a=c(0.1, 0.238546)) %>%
    format_numbers_at(vars(a))




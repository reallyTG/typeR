library(tidytidbits)


### Name: format_p_values_at
### Title: Format numeric columns for display
### Aliases: format_p_values_at

### ** Examples

library(tibble)
library(magrittr)
library(dplyr)
tibble(p=c(0.05, 0.0001)) %>%
    format_numbers_at(vars(p))




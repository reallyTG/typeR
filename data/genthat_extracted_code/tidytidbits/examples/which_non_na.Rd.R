library(tidytidbits)


### Name: which_non_na
### Title: Get indices of non-NA values
### Aliases: which_non_na

### ** Examples

library(tibble)
library(magrittr)
library(dplyr)
# Creates a list column containing (2,3);(3);(1,2,3)
tibble(a=c(NA, NA, 2), b=c(4, NA, 5), c=c(1, 2, 3)) %>%
  mutate(non_na_idc=which_non_na(a, b, c))




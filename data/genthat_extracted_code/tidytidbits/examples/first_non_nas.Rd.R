library(tidytidbits)


### Name: first_non_nas
### Title: Row-wise first value which is not NA
### Aliases: first_non_nas

### ** Examples

library(tibble)
library(magrittr)
library(dplyr)
# Creates a column containing (4, 2, 2)
tibble(a=c(NA, NA, 2), b=c(4, NA, 5), c=c(1, 2, 3)) %>%
  mutate(essence=first_non_nas(a, b, c))




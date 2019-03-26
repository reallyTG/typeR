library(tidytidbits)


### Name: prepend_object
### Title: Prepending in a pipe, never unlisting
### Aliases: prepend_object

### ** Examples

#' library(tibble)
library(magrittr)
library(dplyr)
results <- list(second=list(1,2), third=list(3))
list(-1, 1) %>%
  prepend_object(results, "first") ->
results
# results has length 3, containing three lists




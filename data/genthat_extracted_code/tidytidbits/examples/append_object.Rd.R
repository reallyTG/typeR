library(tidytidbits)


### Name: append_object
### Title: Appending in a pipe, never unlisting
### Aliases: append_object

### ** Examples

library(magrittr)
results <- list(first=c(3,4), second=list(5,6))
list(7,8) %>%
  append_object(results, "third result") ->
results
# results has length 1, containing one list named "first"




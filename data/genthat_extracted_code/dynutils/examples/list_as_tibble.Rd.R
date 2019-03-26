library(dynutils)


### Name: list_as_tibble
### Title: Convert a list of lists to a tibble
### Aliases: list_as_tibble

### ** Examples

library(purrr)

li <- list(
  list(a = 1, b = log10, c = "parrot") %>% add_class("myobject"),
  list(a = 2, b = sqrt, c = "quest") %>% add_class("yourobject")
)

tib <- list_as_tibble(li)

tib




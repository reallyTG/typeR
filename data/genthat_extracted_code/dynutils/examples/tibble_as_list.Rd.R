library(dynutils)


### Name: tibble_as_list
### Title: Convert a tibble to a list of lists
### Aliases: tibble_as_list

### ** Examples

library(tibble)

tib <- tibble(
  a = c(1, 2),
  b = list(log10, sqrt),
  c = c("parrot", "quest"),
  .object_class = list(c("myobject", "list"), c("yourobject", "list"))
)

li <- tibble_as_list(tib)

li




library(dynutils)


### Name: extract_row_to_list
### Title: Extracts one row from a tibble and converts it to a list
### Aliases: extract_row_to_list

### ** Examples

library(tibble)

tib <- tibble(
  a = c(1, 2),
  b = list(log10, sqrt),
  c = c("parrot", "quest"),
  .object_class = list(c("myobject", "list"), c("yourobject", "list"))
)

extract_row_to_list(tib, 2)




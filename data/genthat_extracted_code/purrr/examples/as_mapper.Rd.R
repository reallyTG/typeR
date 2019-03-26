library(purrr)


### Name: as_mapper
### Title: Convert an object into a mapper function
### Aliases: as_mapper as_function as_mapper.character as_mapper.numeric
###   as_mapper.list

### ** Examples

as_mapper(~ . + 1)
as_mapper(1)

as_mapper(c("a", "b", "c"))
# Equivalent to function(x) x[["a"]][["b"]][["c"]]

as_mapper(list(1, "a", 2))
# Equivalent to function(x) x[[1]][["a"]][[2]]

as_mapper(list(1, attr_getter("a")))
# Equivalent to function(x) attr(x[[1]], "a")

as_mapper(c("a", "b", "c"), .null = NA)




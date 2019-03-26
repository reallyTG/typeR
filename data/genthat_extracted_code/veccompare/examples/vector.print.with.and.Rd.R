library(veccompare)


### Name: vector.print.with.and
### Title: Print a vector with commas and a final "and".
### Aliases: vector.print.with.and

### ** Examples

vector.print.with.and(c("One", "Two", "Three", "Four"))
vector.print.with.and(c("One", "Two", "Three", "Four"), use_oxford_comma = FALSE)
vector.print.with.and(c("One", "Two"))
vector.print.with.and(c("One"))
vector.print.with.and(c(), string_to_return_if_vector_is_empty = "(None)") # Outputs "(None)"
vector.print.with.and(c(""), string_to_return_if_vector_is_empty = "(None)") # Outputs ""




library(rlang)


### Name: arg_match
### Title: Match an argument to a character vector
### Aliases: arg_match

### ** Examples

fn <- function(x = c("foo", "bar")) arg_match(x)
fn("bar")

# This would throw an informative error if run:
# fn("b")
# fn("baz")




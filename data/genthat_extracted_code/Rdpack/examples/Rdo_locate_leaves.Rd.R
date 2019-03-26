library(Rdpack)


### Name: Rdo_locate_leaves
### Title: Find leaves of an Rd object using a predicate
### Aliases: Rdo_locate_leaves
### Keywords: Rd

### ** Examples

dummyfun <- function(x) x

fn <- tempfile("dummyfun", fileext="Rd")
reprompt(dummyfun, filename=fn)
rdo <- tools::parse_Rd(fn)

f <-  function(x) Rdo_is_newline(x)

nl <- Rdo_locate_leaves(rdo, f )

length(nl)  # there are quite a few newline leaves!




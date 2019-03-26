library(Rdpack)


### Name: Rdo_reparse
### Title: Reparse an Rd object
### Aliases: Rdo_reparse
### Keywords: Rd

### ** Examples

# the following creates Rd object rdo
dummyfun <- function(x) x
fn <- tempfile("dummyfun", fileext="Rd")
reprompt(dummyfun, filename=fn)
rdo <- tools::parse_Rd(fn)

dottext <- "further arguments to be passed on."

rdo2 <- Rdo_append_argument(rdo, "...", dottext, create = TRUE)
rdo2 <- Rdo_append_argument(rdo2, "z", "a numeric vector")

Rdo_show(Rdo_reparse(rdo2))

# the following does ot show the arguments. (todo: why?)
#    (see also examples in Rdo_append_argument)
Rdo_show(rdo2)






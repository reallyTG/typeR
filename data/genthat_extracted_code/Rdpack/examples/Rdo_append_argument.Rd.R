library(Rdpack)


### Name: Rdo_append_argument
### Title: Append an item for a new argument to an Rd object
### Aliases: Rdo_append_argument
### Keywords: RdoBuild

### ** Examples

# the following creates Rd object rdo
dummyfun <- function(x) x
fn <- tempfile("dummyfun", fileext=".Rd")
reprompt(dummyfun, filename=fn)
rdo <- tools::parse_Rd(fn)

dottext <- "further arguments to be passed on."

# rdo2 <- Rdo_append_argument(rdo, "...", dottext, create = TRUE)
rdo2 <- Rdo_append_argument(rdo, "...", dottext, create = TRUE)
rdo2 <- Rdo_append_argument(rdo2, "z", "a numeric vector")
Rdo_show(reprompt(rdo2))

# todo: Rdo_show(rdob) for some reason does not show the arguments.
#       investigate! Rdo_show uses Rd2txt. Is it possible that the
#       latter needs srcref's in the Rd object? They are only refreshed
#       Rd_parse is called.


unlink(fn)





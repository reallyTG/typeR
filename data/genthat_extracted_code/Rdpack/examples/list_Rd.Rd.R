library(Rdpack)


### Name: list_Rd
### Title: Combine Rd fragments
### Aliases: list_Rd
### Keywords: RdoBuild

### ** Examples

## see also the examples for c_Rd

dummyfun <- function(x, ...) x

u1 <- list_Rd(name = "Dummyname", alias = "dummyfun",
              title = "Dummy title", description = "Dummy description",
              usage = "dummyfun(x)",
              value = "numeric vector",
              author = "A. Author",
              Rd_class=TRUE )

Rdo_show(u1)

# call reprompt to fill the arguments section
#    (and correct the usage)

fn <- tempfile("dummyfun", fileext="Rd")
reprompt(dummyfun, filename=fn)

# check that the result can be parsed and show it.
Rdo_show(tools::parse_Rd(fn))

unlink(fn)





library(Rdpack)


### Name: Rdo_set_section
### Title: Replace a section in an Rd file
### Aliases: Rdo_set_section
### Keywords: RdoBuild

### ** Examples

dummyfun <- function(x) x

fn <- tempfile("dummyfun", fileext = "Rd")
reprompt(dummyfun, filename = fn)
Rdo_show(tools::parse_Rd(fn))

## set the author section, create it if necessary.
Rdo_set_section("A.A. Author", "author", fn, create = TRUE)
Rdo_show(tools::parse_Rd(fn))

## replace the author section
Rdo_set_section("Georgi N. Boshnakov", "author", fn)
Rdo_show(tools::parse_Rd(fn))

unlink(fn)




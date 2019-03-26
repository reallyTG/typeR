library(gbRd)


### Name: Rdo_create
### Title: Create basic Rd objects
### Aliases: Rdo_create Rdo_empty
### Keywords: Rd

### ** Examples

require(tools)   # for Rd2txt
a1 <- Rdo_get_args("seq")
a1
Rdo_create(a1)
Rd2txt(Rdo_create(a1))

a2 <- Rdo_get_args("seq", c("from", "to", "by"))
a2
Rdo_create(a2)
Rd2txt(Rdo_create(a2))

Rdo_empty()
class(Rdo_empty())
str(Rdo_empty())




library(gbRd)


### Name: Rdo_get_args
### Title: Extract argument description from a help topic
### Aliases: Rdo_get_args Rdo_get_arg
### Keywords: Rd

### ** Examples

h1 <- help("seq")
Rdo_get_args(h1)
Rdo_get_args(h1,"by")
Rdo_get_args(h1,"length.out")
Rdo_get_args(h1,"...")
Rdo_get_args(h1,"from")
Rdo_get_args(h1,c("from","by"))
Rdo_get_args(h1,c("from", "to"))

Rdo_get_args("seq")
Rdo_get_args("seq","by")
Rdo_get_args("seq","length.out")
Rdo_get_args("seq","...")
Rdo_get_args("seq","from")
Rdo_get_args("seq",c("from","by"))
Rdo_get_args("seq",c("from", "to"))




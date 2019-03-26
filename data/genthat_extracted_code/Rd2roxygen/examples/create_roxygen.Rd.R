library(Rd2roxygen)


### Name: create_roxygen
### Title: Create the roxygen documentation
### Aliases: create_roxygen

### ** Examples

rd.file = system.file("examples", "parse_and_save.Rd", package = "Rd2roxygen")
options(roxygen.comment = "##' ")
create_roxygen(parse_file(rd.file))




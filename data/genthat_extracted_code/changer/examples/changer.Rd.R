library(changer)


### Name: changer
### Title: Change Name of Existing R Package
### Aliases: changer

### ** Examples

content <- letters
package.skeleton("package.with.boring.name", path = tempdir())
readLines(file.path(tempdir(), "package.with.boring.name", "DESCRIPTION"))

changer(file.path(tempdir(), "package.with.boring.name"), 
  new_name = "superpack", check_validity = FALSE, ask = FALSE)
readLines(file.path(tempdir(), "superpack", "DESCRIPTION"))
unlink(file.path(tempdir(), "superpack"), recursive = TRUE)





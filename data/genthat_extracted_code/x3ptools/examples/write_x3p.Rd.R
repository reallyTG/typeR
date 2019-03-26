library(x3ptools)


### Name: write_x3p
### Title: Write an x3p object to a file
### Aliases: write_x3p

### ** Examples

logo <- read_x3p(system.file("csafe-logo.x3p", package="x3ptools"))
# write a copy of the file into a temporary file
write_x3p(logo, file = tempfile(fileext="x3p")) 




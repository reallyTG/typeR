library(sclero)


### Name: assign.size
### Title: Assign spot sizes to 'rawDist' objects for estimating spatial
###   extent of sample averaging error.
### Aliases: assign.size

### ** Examples

data(shellspots)
shell <- convert.ijdata(shellspots)
path <- file.path(system.file("extdata", package = "sclero"))
sizes <- assign.size(shell, path = path)
sizes$spot.area




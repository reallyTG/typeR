library(disto)


### Name: `[[.disto`
### Title: Extract a single value from disto object
### Aliases: `[[.disto` [[.disto

### ** Examples

temp <- stats::dist(iris[,1:4])
dio  <- disto(objectname = "temp")
dio

dio[[1, 2]]
dio[[2, 1]]
dio[[k = 3]]




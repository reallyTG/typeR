library(actuar)


### Name: Extract.grouped.data
### Title: Extract or Replace Parts of a Grouped Data Object
### Aliases: Extract.grouped.data [.grouped.data [<-.grouped.data
### Keywords: manip array

### ** Examples

data(gdental)

(x <- gdental[1])         # select column 1
class(x)                  # no longer a grouped.data object
class(gdental[2])         # same
gdental[, 1]              # group boundaries
gdental[, 2]              # group frequencies

gdental[1:4,]             # a subset
gdental[c(1, 3, 5),]      # avoid this

gdental[1:2, 1] <- c(0, 30, 60) # modified boundaries
gdental[, 2] <- 10              # modified frequencies
## Not run: gdental[1, ] <- 2   # not allowed




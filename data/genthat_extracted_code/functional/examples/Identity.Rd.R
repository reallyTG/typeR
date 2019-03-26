library(functional)


### Name: Identity
### Title: Identity function.
### Aliases: Identity

### ** Examples

list.copy <- function(list)
  Reduce(Identity, list)

list <- c(1, 2, 3)
stopifnot(list.copy(list) == list)




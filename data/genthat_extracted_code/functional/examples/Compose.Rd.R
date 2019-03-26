library(functional)


### Name: Compose
### Title: Compose an arbitrary number of functions.
### Aliases: Compose

### ** Examples

car <- function(list) list[[1]]
cdr <- function(list) list[2:length(list)]
cadr <- Compose(cdr, car)
stopifnot(cadr(c(1,2,3)) == 2)




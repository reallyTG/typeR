library(mvbutils)


### Name: extract.named
### Title: Create variables from corresponding named list elements
### Aliases: extract.named
### Keywords: programming

### ** Examples

ff <- function(...) { extract.named( list(...)); print( ls()); bbb }
# note bbb is not "declared"
ff( bbb=6, ccc=9) # prints [1] "bbb" "ccc", returns 6




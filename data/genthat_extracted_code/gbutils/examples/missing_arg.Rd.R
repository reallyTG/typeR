library(gbutils)


### Name: missing_arg
### Title: Check if an element of a pairlist is missing
### Aliases: missing_arg
### Keywords: programming

### ** Examples

lmargs <- formals(lm)
class(lmargs) # pairlist
missing_arg(lmargs$data)
## which arguments of lm() have no (explicit) defaults?
sapply(lmargs, missing_arg)

## This gives an error:
## pairlist(x = 3, y = , z = 5)

## an example with alist()
pl2 <- alist(a = "", b = , c = 3)
class(pl2) # list
## this shows that 'b' is missing, 'a' and 'c' are not:
sapply(pl2, missing_arg) # FALSE  TRUE FALSE
## superficially, 'b' is equal to the empty string:
pl2[[2]]
sapply(pl2, function(x) x == "") # TRUE  TRUE FALSE

## with pairlist the results are the same:
g <- function(a = "", b, c = 3) NULL
a.g <- formals(g)
class(a.g) # pairlist
sapply(a.g, missing_arg) # FALSE  TRUE FALSE
a.g[[2]]
sapply(a.g, function(x) x == "") # TRUE  TRUE FALSE




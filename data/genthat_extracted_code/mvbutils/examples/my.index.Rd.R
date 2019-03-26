library(mvbutils)


### Name: my.index
### Title: Arbitrary-level retrieval from and modification of recursive
###   objects
### Aliases: my.index my.index.assign my.index.exists
### Keywords: programming utilities

### ** Examples

local({
  assign( "[[", my.index)
  assign( "[[<-", my.index.assign)
  ff <- function() { a <- b + c }
  body( ff)[[2,3,2]] # as.name( "b")
  my.index.exists( c(2,3,2), body( ff)) # TRUE
  my.index.exists( c(2,3,2,1), body( ff)) # FALSE
  body( ff)[[2,3,2]] <- quote( ifelse( a>1,2,3))
  ff # function () { a <- ifelse(a > 1, 2, 3) + c }
  my.index.exists( c(2,3,2,1), body( ff)) # now TRUE
})




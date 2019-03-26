library(mpoly)


### Name: mpolyList
### Title: Define a collection of multivariate polynomials.
### Aliases: mpolyList

### ** Examples

( p1 <- mp("t^4 - x") )
( p2 <- mp("t^3 - y") )
( p3 <- mp("t^2 - z") )
( ms <- mpolyList(p1, p2, p3) )
is.mpolyList( ms )

mpolyList(mp("x + 1"))
p <- mp("x + 1")
mpolyList(p)

ps <- mp(c("x + 1", "y + 2"))
is.mpolyList(ps)


f <- function(){
  a <- mp("1")
  mpolyList(a)
}
f()






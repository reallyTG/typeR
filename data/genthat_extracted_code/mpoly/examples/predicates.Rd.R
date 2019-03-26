library(mpoly)


### Name: predicates
### Title: mpoly predicate functions
### Aliases: predicates is.constant is.mpoly is.unipoly is.bernstein
###   is.bezier is.chebyshev is.mpolyList is.linear

### ** Examples


p <- mp("5")
is.mpoly(p)
is.constant(p)

is.constant(mp(c("x + 1", "7", "y - 2")))

p <- mp("x + y")
is.mpoly(p)

is.mpolyList(mp(c("x + 1", "y - 1")))



is.linear(mp("0"))
is.linear(mp("x + 1"))
is.linear(mp("x + y"))
is.linear(mp(c("0", "x + y")))

is.linear(mp("x + x y"))
is.linear(mp(c("x + x y", "x")))


(p <- bernstein(2, 5))
is.mpoly(p)
is.bernstein(p)

(p <- chebyshev(5))
is.mpoly(p)
is.chebyshev(p)
str(p)




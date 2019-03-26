library(mpoly)


### Name: mp
### Title: Define a multivariate polynomial.
### Aliases: mp make_indeterminate_list

### ** Examples


( m <- mp("x + y + x y") )
is.mpoly( m )
unclass(m)


mp("x + 2 y + x^2 y + x y z")
mp("x + 2 y + x^2 y + x y z", varorder = c("y", "z", "x"))

( ms <- mp(c("x + y", "2 x")) )
is.mpolyList(ms)


gradient( mp("x + 2 y + x^2 y + x y z") )
gradient( mp("(x + y)^10") )

# mp and the print methods are kinds of inverses of each other
( polys <- mp(c("x + y", "x - y")) )
strings <- print(polys, silent = TRUE)
strings
mp(strings)





library(algstat)


### Name: variety
### Title: Compute a Variety
### Aliases: variety

### ** Examples

## Not run: 
##D 
##D 
##D polys <- mp(c(
##D   "x^2 - y^2 - z^2 - .5",
##D   "x^2 + y^2 + z^2 - 9",
##D   ".25 x^2 + .25 y^2 - z^2"
##D ))
##D variety(polys)
##D 
##D # algebraic solution :
##D c(sqrt(19)/2, 7/(2*sqrt(5)), 3/sqrt(5)) # +/- each ordinate
##D 
##D 
##D 
##D # character vectors can be taken in; they're passed to mp
##D variety(c("y - x^2", "y - x - 2"))
##D 
##D 
##D 
##D # an example of how varieties are invariant to the
##D # the generators of the ideal
##D variety(c("2 x^2 + 3 y^2 - 11", "x^2 - y^2 - 3"))
##D 
##D # the following takes a few seconds to initialize, feel free to them
##D # gb <- grobner(mp(c("2 x^2 + 3 y^2 - 11", "x^2 - y^2 - 3")))
##D # variety(gb)
##D 
##D m2("
##D R = QQ[x,y]
##D gens gb ideal(2*x^2 + 3*y^2 - 11, x^2 - y^2 - 3)
##D ")
##D variety(c("y^2 - 1", "x^2 - 4"))
##D variety(c("x^2 - 4", "y^2 - 1"))
##D 
##D 
##D 
##D # variable order is by default equal to vars(mpolyList)
##D # (this finds the zeros of y = x^2 - 1)
##D variety(c("y", "y - x^2 + 1")) # y, x
##D vars(mp(c("y", "y - x^2 + 1")))
##D variety(c("y", "y - x^2 + 1"), c("x", "y")) # x, y
##D 
##D 
##D 
##D # complex solutions
##D variety("x^2 + 1")
##D variety(c("x^2 + 1 + y", "y"))
##D 
##D 
##D # multiplicities
##D variety("x^2")
##D variety(c("2 x^2 + 1 + y", "y + 1"))
##D variety(c("x^3 - x^2 y", "y + 2"))
##D 
##D 
##D #
##D p <- mp(c("2 x  -  2  -  3 x^2 l  -  2 x l",
##D   "2 y  -  2  +  2 l y",
##D   "y^2  -  x^3  -  x^2"))
##D variety(p)
##D 
## End(Not run)




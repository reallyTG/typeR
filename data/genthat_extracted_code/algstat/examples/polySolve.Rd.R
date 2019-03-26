library(algstat)


### Name: polySolve
### Title: Solve a System of Polynomial Equations
### Aliases: polySolve

### ** Examples

## Not run: 
##D 
##D # it can solve linear systems
##D # (here where the line y = x intersects y = 2 - x)
##D polySolve(c("y", "y"), c("x", "2 - x"), c("x", "y"))
##D 
##D # or nonlinear systems
##D polySolve(c("y", "y"), c("x^2", "2 - x^2"), c("x", "y"))
##D 
##D # perhaps an easier specification is equations themselves
##D # with either the " = " or " == " specifications
##D # varOrder is used to order the solutions returned
##D polySolve(c("y = x^2", "y = 2 - x^2"), varOrder = c("x", "y"))
##D polySolve(c("y == x^2", "y == 2 - x^2"), varOrder = c("x", "y"))
##D 
##D 
##D # mpoly objects can be given instead of character strings
##D lhs <- mp(c("y - (2 - x)", "x y"))
##D rhs <- mp(c("0","0"))
##D polySolve(lhs, rhs, varOrder = c("x", "y"))
##D 
##D # if no default right hand side is given, and no "=" or "==" is found,
##D # rhs is taken to be 0's.
##D # below is where the lines y = x and y = -x intersect the unit circle
##D polySolve(c("(y - x) (y + x)", "x^2 + y^2 - 1"))
##D 
##D # the output object is a bertini object
##D out <- polySolve(c("(y - x) (y + x)", "x^2 + y^2 - 1"))
##D str(out,1)
##D 
##D # here is the code that was run :
##D cat(out$bertiniCode)
##D 
##D # the finite and real solutions:
##D out$finite_solutions
##D out$real_finite_solutions
##D 
##D 
##D 
##D 
##D # example from Riccomagno (2008), p. 399
##D polySolve(c(
##D   "x (x - 2) (x - 4) (x - 3)",
##D   "(y - 4) (y - 2) y",
##D   "(y - 2) (x + y - 4)",
##D   "(x - 3) (x + y - 4)"
##D ))
##D 
## End(Not run)




library(algstat)


### Name: polyOptim
### Title: Polynomial Optimization
### Aliases: polyOptim

### ** Examples

## Not run: 
##D 
##D # unconstrained optimization of polynomial functions is available
##D polyOptim("x^2")
##D polyOptim("-x^2")
##D polyOptim("-(x - 2)^2")
##D polyOptim("-(x^2 + y^2)")
##D polyOptim("-(x^2 + (y - 2)^2)")
##D 
##D polyOptim("(x - 1) (x - 2) (x - 3)") # fix global labeling
##D 
##D 
##D # constrained optimization over the affine varieties is also available
##D # (affine variety = solution set of polynomial equations)
##D 
##D # find the critical points of the plane f(x,y) = x + y
##D # over the unit circle x^2 + y^2 = 1
##D polyOptim("x + y", "x^2 + y^2 = 1")
##D 
##D # you can specify them as a combo of mpoly, mpolyList, and characters
##D o <- mp("x + y")
##D c <- "x^2 + y^2 = 1"
##D polyOptim(o, c)
##D 
##D c <- mp("x^2 + y^2 - 1")
##D polyOptim(o, c)
##D 
##D out <- polyOptim("x + y", c)
##D str(out)
##D 
##D # another example, note the solutions are computed over the complex numbers
##D polyOptim("x^2 y", "x^2 + y^2 = 3")
##D # solutions: (+-sqrt(2), +-1) and (0, +-sqrt(3))
##D 
##D 
##D 
##D 
## End(Not run)




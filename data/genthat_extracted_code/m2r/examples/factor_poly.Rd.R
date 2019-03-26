library(m2r)


### Name: factor_poly
### Title: Factor a polynomial
### Aliases: factor_poly factor_poly.

### ** Examples


## Not run: 
##D  requires Macaulay2 be installed and an interactive session
##D 
##D ##### basic usage
##D ########################################
##D 
##D ring("x", "y", coefring = "QQ")
##D factor_poly("x^4 - y^4")
##D 
##D # reference function
##D factor_poly.("x^4 - y^4")
##D 
##D 
##D ##### different inputs
##D ########################################
##D 
##D # factor_poly accepts mpoly objects:
##D (p <- mp("x^4 - y^4"))
##D factor_poly.(p)
##D factor_poly(p)
##D mp("(x-y) (x+y) (x^2+y^2)")
##D 
##D 
##D 
##D ##### other examples
##D ########################################
##D 
##D ring("x","y", "z", coefring = "QQ")
##D (p <- mp("(x^2 - y) (x^2 + y) (x + y)^2 (x - z)^2"))
##D factor_poly.(p)
##D factor_poly(p)
##D 
##D (p <- mp("(x-1)^3 (y-1)^3"))
##D factor_poly.(p)
##D factor_poly(p)
##D 
## End(Not run)




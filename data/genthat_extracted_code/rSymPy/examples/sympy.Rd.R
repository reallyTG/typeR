library(rSymPy)


### Name: sympy
### Title: sympy
### Aliases: sympy sympyStart jythonStart
### Keywords: symbolmath

### ** Examples

## Not run: 
##D # These examples are mostly from: http://wiki.sympy.org/wiki/Tutorial
##D 
##D # create a SymPy variable called x
##D sympy("var('x')")
##D sympy("y = x*x")
##D sympy("y")
##D 
##D sympy("limit(1/x, x, oo)")
##D 
##D # the next line fails under jython even without R
##D # and seems to corrupt the rest of the session
##D # sympy("(1/cos(x)).series(x, 0, 10)")
##D 
##D sympy("diff(sin(2*x), x, 1)")
##D sympy("diff(sin(2*x), x, 2)")
##D 
##D sympy("integrate(exp(-x), (x, 0, oo))")
##D 
##D sympy("xr = Symbol('xr', real=True)")
##D sympy("exp(I*xr).expand(complex=True)")
##D 
##D # Matrices are stored row by row (unlike R matrices)
##D cat(sympy("A = Matrix([[1,x], [y,1]])"), "\n")
##D cat(sympy("A**2"), "\n")
##D 
##D 
## End(Not run)




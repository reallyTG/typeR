library(cxxfunplus)


### Name: cxxfunctionplus
### Title: To created an S4 class 'cxxdso' from C++ code
### Aliases: cxxfunctionplus

### ** Examples
## Not run: 
##D src <-  ' return ScalarReal(INTEGER(x)[0] * REAL(y)[0]);'
##D dso <- cxxfunctionplus(signature(x = "integer", y = "numeric"), src)
##D show(dso)
## End(Not run)



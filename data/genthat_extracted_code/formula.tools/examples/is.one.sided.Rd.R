library(formula.tools)


### Name: is.one.sided
### Title: Determine if an object is one- or two-sided. Test whether a
###   object (typically formula, call or expression) is one- (e.g.  '~x')
###   or two-sided (e.g. 'x~y').
### Aliases: is.one.sided is.one.sided,formula-method
###   is.one.sided,call-method is.one.sided,<--method
###   is.one.sided,expression-method is.one.sided,list-method
###   is.one.sided,ANY-method is.two.sided is.two.sided,formula-method
###   is.two.sided,call-method is.two.sided,<--method
###   is.two.sided,expression-method is.two.sided,list-method
###   is.two.sided,ANY-method

### ** Examples


form <- y ~ x 

is.one.sided(form)
# is.single.sided(form)
# is.unary(form) 

is.two.sided(form)
# is.double.sided(form)
# is.binary(form)
                




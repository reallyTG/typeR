library(copBasic)


### Name: tailordCOP
### Title: The Lower- and Upper-Tail Orders of a Copula
### Aliases: tailordCOP
### Keywords: copula (characteristics) copula (properties) copula (tail
###   characteristics) copula (tail properties) Joe (2014) Examples and
###   Exercises

### ** Examples

# Joe (2014, p. 5) names MTCJ = Mardia-Takahasi-Cook-Johnson copula
"MTCJ" <- function(u,v,para) { (u^(-para) + v^(-para) - 1)^(-1/para) }
# The results that follow match those reported by Joe (2014, p. 69) who
# analytically derives KappaL = 1 and KappaU = 2.
# TAIL ORDER:
tailordCOP(cop=MTCJ, para=3, plot=TRUE) # kappaL  = 1.00667, kappaU  = 1.96296
# TAIL DEPENDENCY:
taildepCOP(cop=MTCJ, para=3, plot=TRUE) # lambdaL = 0,       lambdaU = 0.7937
# Joe (2014) reports lambdaL = 2^(-1/para) = 2^(-1/3) = 0.7937005




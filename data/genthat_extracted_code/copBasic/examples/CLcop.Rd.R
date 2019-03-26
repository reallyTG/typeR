library(copBasic)


### Name: CLcop
### Title: The Clayton Copula
### Aliases: CLcop
### Keywords: Clayton copula copula (formulas) copula Joe (2014) Examples
###   and Exercises

### ** Examples

# Lower tail dependency of Theta = pi --> 2^(-1/pi) = 0.8020089 (Joe, 2014, p. 168)
taildepCOP(cop=CLcop, para=pi)$lambdaL # 0.80201




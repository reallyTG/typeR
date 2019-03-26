library(planor)


### Name: planor.model
### Title: Model and Estimate Specifications for a Design Search
### Aliases: planor.model
### Keywords: design

### ** Examples

### Basic example
planor.model(model=~block + (A+B+C)^2, estimate=~(A+B+C)^2)
### Resolution: both calls to planor.model below are equivalent
planor.model(model=~(A+B+C+D)^2, estimate=~A+B+C+D)
myfactors <- planor.factors(factors=c(LETTERS[1:4]), nlevels=rep(2,4))
planor.model(resolution=4, factors=myfactors)
### Complicated examples
planor.model(~A+B+C+D+A:B, ~A+B+C+D, listofmodels=list(c(~E+F,~E)))
planor.model(~A+B+C+D+A:B,~A+B+C+D, listofmodels=
                              list(c(~E+F,~E), ~G, ~H, c(~M+N,~N)))




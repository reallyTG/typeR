library(psychotools)


### Name: elementary_symmetric_functions
### Title: Calculation of the Elementary Symmetric Functions and Their
###   Derivatives
### Aliases: elementary_symmetric_functions
### Keywords: misc

### ** Examples

## No test: 
 ## zero and first order derivatives of 100 dichotomous items
 di <- rnorm(100)
 system.time(esfC <- elementary_symmetric_functions(di, order = 1))
 
 ## again with R implementation
 system.time(esfR <- elementary_symmetric_functions(di, order = 1,
 engine = "R"))

 ## are the results equal?
 all.equal(esfC, esfR)
## End(No test)

 ## calculate zero and first order elementary symmetric functions
 ## for 10 polytomous items with three categories each.
 pi <- split(rnorm(20), rep(1:10, each = 2))
 x <- elementary_symmetric_functions(pi)

 ## use difference algorithm instead and compare results
 y <- elementary_symmetric_functions(pi, diff = TRUE)
 all.equal(x, y)




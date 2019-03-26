library(tractor.base)


### Name: equivalent
### Title: Test two numeric vectors for equivalence
### Aliases: equivalent

### ** Examples


equivalent(c(-1,1), c(1,1))  # FALSE
equivalent(c(-1,1), c(1,1), signMatters=FALSE)  # TRUE
equivalent(1:2, 2:3, tolerance=2)  # TRUE





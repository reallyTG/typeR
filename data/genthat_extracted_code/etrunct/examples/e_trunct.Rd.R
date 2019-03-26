library(etrunct)


### Name: e_trunct
### Title: Compute moments of univariate truncated t distribution
### Aliases: e_trunct

### ** Examples

 e_trunct(-3,3,3,2) # second moment of t distribution on 3df truncated to (-3,3)
 e_trunct(-2,2,4,1) # first moment, should be 0 by symmetry

 e_trunct(c(-3,-2),c(3,2),c(3,4),c(2,1)) # the function is vectorized






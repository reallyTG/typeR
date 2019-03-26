library(symmoments)


### Name: convert.multipol
### Title: Convert between multipol and list representations of
###   multivariate polynomials
### Aliases: ' convert.multipol '

### ** Examples

# create an mpoly object to work with
library(mpoly)
t0 <- mpoly(list(c(coef=3,x1=2),c(coef=2,x1=1,x2=3),
                   c(coef=-4,z=2),c(coef=1,x1=1,x2=2,z=1))) 

# convert from mpoly to list representation
t1 <- convert.mpoly(t0)    
# convert from list representation to a multipol object
t2 <- convert.multipol(t1) 
# convert back to a list representation
t3 <- convert.multipol(t2) 




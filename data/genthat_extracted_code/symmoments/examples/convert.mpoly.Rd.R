library(symmoments)


### Name: convert.mpoly
### Title: Convert between mpoly and list representations of multivariate
###   polynomials
### Aliases: ' convert.mpoly '

### ** Examples

# create an mpoly object here

# convert from mpoly to list representation
library(mpoly)
t0 <- mpoly(list(c(coef=3,x1=2),c(coef=2,x1=1,x2=3),
                   c(coef=-4,z=2),c(coef=1,x1=1,x2=2,z=1)))  
t1 <- convert.mpoly(t0)    
# convert from list representation back to an mpoly object
t2 <- convert.mpoly(t1) 





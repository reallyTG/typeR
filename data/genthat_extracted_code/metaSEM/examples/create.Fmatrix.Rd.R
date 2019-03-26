library(metaSEM)


### Name: create.Fmatrix
### Title: Create an F matrix to select observed variables
### Aliases: create.Fmatrix
### Keywords: utilities

### ** Examples

## Select the first 3 variables while the other 2 variables are latent.
create.Fmatrix(c(1,1,1,0,0))
# FullMatrix 'Fmatrix' 
#
# @labels: No labels assigned.
#
# @values
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    0    0    0    0
# [2,]    0    1    0    0    0
# [3,]    0    0    1    0    0
#
# @free: No free parameters.
#
# @lbound: No lower bounds assigned.
#
# @ubound: No upper bounds assigned.

create.Fmatrix(c(1,1,1,0,0), as.mxMatrix=FALSE)
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    0    0    0    0
# [2,]    0    1    0    0    0
# [3,]    0    0    1    0    0




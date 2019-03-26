library(lintools)


### Name: sparse_constraints
### Title: Generate sparse set of constraints.
### Aliases: sparse_constraints sparseConstraints
###   sparse_constraints.data.frame print.sparse_constraints

### ** Examples


# The following system of constraints, stored in
# row-column-coefficient format
#
# x1 + x8 ==  950,
# x3 + x4 ==  950 ,
# x6 + x7 == x8,
# x4 > 0
# 
A <- data.frame( 
   row = c( 1, 1, 2, 2, 3, 3, 3, 4)
   , col = c( 1, 2, 3, 4, 2, 5, 6, 4)
   , coef = c(-1,-1,-1,-1, 1,-1,-1,-1)
)
b <- c(-950, -950, 0,0) 

sc <- sparse_constraints(A, b, neq=3)

# Adjust the 0-vector minimally so all constraints are met:
sc$project(x=rep(0,8))

# Use the same object to adjust the 100*1-vector
sc$project(x=rep(100,8))

# use the same object to adjust the 0-vector, but with different weights
sc$project(x=rep(0,8),w=1:8)






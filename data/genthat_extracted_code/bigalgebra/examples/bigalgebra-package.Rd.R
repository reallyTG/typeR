library(bigalgebra)


### Name: bigalgebra-package
### Title: Arithmetic routines for native R matrices and big.matrix
###   objects.
### Aliases: bigalgebra-package bigalgebra
### Keywords: package

### ** Examples


# Testing the development of the user-friendly operators:
# if you have any problems, please email us!  - Jay & Mike 4/29/2010

library("bigmemory")
A <- big.matrix(5,4,init=1)
B <- big.matrix(4,4,init=2)

C <- A 
D <- A[] 

print(C - D)       # Compare the results (subtraction of an R matrix from a
                   # big.matrix)

# The next example illustrates mixing R and big.matrix objects. It returns by
# default (see # options("bigalgebra.mixed_arithmetic_returns_R_matrix")
D <- matrix(rnorm(16),4)
E <- A 




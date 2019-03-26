library(hyperSpec)


### Name: Arith
### Title: Arithmetical Operators for hyperSpec objects
### Aliases: Arith Arith,hyperSpec-method Arith,hyperSpec,hyperSpec-method
###   +,hyperSpec,hyperSpec-method -,hyperSpec,hyperSpec-method
###   *,hyperSpec,hyperSpec-method ^,hyperSpec,hyperSpec-method
###   %%,hyperSpec,hyperSpec-method %/%,hyperSpec,hyperSpec-method
###   /,hyperSpec,hyperSpec-method Arith,hyperSpec,matrix-method
###   Arith,hyperSpec,numeric-method Arith,hyperSpec,missing-method
###   Arith,matrix,hyperSpec-method Arith,numeric,hyperSpec-method %*%
###   %*%,hyperSpec,hyperSpec-method %*%,matrix,hyperSpec-method
###   %*%,hyperSpec,matrix-method Arith,hyperSpec,numeric-method
###   Arith,hyperSpec,matrix-method Arith,hyperSpec,missing-method
###   Arith,numeric,hyperSpec-method Arith,matrix,hyperSpec-method
###   %*%,hyperSpec,hyperSpec-method %*% %*%,matrix,hyperSpec-method
###   %*%,hyperSpec,matrix-method %*%,hyperSpec,matrix-method
###   %*%,matrix,hyperSpec-method
### Keywords: arith methods

### ** Examples

flu + flu
1 / flu
all((flu + flu - 2 * flu)[[]] == 0)
-flu
flu / flu$c




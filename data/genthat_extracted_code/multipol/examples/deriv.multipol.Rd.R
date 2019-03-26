library(multipol)


### Name: deriv
### Title: Partial differentitation
### Aliases: deriv deriv.multipol
### Keywords: array

### ** Examples

a <- as.multipol(matrix(1:12,3,4))

deriv(a,1)     # standard usage: derivfferentiate WRT x1
deriv(a,2)     # differentiate WRT x2

deriv(a,1,2)   # second derivative
deriv(a,1,3)   # third derivative (zero multipol)




library(nimble)


### Name: declare
### Title: Explicitly declare a variable in run-time code of a
###   nimbleFunction
### Aliases: declare

### ** Examples

declare(A, logical())             ## scalar logical, the only kind allowed
declare(B, integer(2, c(10, 10))) ## 10 x 10 integer matrix
declare(C, double(3))             ## 3-dimensional double array with no sizes set.




library(RI2by2)


### Name: Perm.CI.RLH
### Title: Permutation test confidence interval for a treatment effect on a
###   binary outcome
### Aliases: Perm.CI.RLH

### ** Examples

ex = matrix(c(11,1,7,21),2,2,byrow=TRUE)
Perm.CI.RLH(ex,0.05)

ex = matrix(c(7,5,1,27),2,2,byrow=TRUE)
Perm.CI.RLH(ex,0.05)
Perm.CI.RLH(ex,0.05, verbose=TRUE)

ex = matrix(c(33,15,11,37),2,2,byrow=TRUE)
Perm.CI.RLH(ex,0.05, total_tests=1000)
## No test: 
Perm.CI.RLH(ex,0.05)

ex = matrix(c(40,60,15,85),2,2,byrow=TRUE)
Perm.CI.RLH(ex,0.05, total_tests=1000)
## End(No test)
## Not run: Perm.CI.RLH(ex,0.05)




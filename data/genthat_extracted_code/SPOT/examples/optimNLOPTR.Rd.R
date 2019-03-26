library(SPOT)


### Name: optimNLOPTR
### Title: Minimization by NLOPT
### Aliases: optimNLOPTR

### ** Examples

## Not run: 
##D ##simple example:
##D res <- optimNLOPTR(,fun = funSphere,lower = c(-10,-20),upper=c(20,8))
##D res
##D ##with an inequality constraint:
##D contr <- list()  #control list
##D ##specify constraint
##D contr$eval_g_ineq <- function(x) 1+x[1]-x[2]
##D res <- optimNLOPTR(,fun=funSphere,lower=c(-10,-20),upper=c(20,8),control=contr) 
##D res
## End(Not run)




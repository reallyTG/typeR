library(symmoments)


### Name:  evaluate_noncentral
### Title: Evaluate a noncentral multivariate moment
### Aliases: ' evaluate_noncentral'

### ** Examples


# evaluate_noncentral(c(3,1,2),c(3,4,1),c(4,2,1,3,1,2))
# evaluates the expected value of X1**3 X2 X3**2 at mean c(1,2,3) 
# and at the following covariance matrix
#    4 2 1 
#    2 3 1 
#    1 1 2 

#  requires all moments up to c(3,1,2) to exist in the symmoments environment.
#  use  make.all.moments(c(3,1,2)) if necessary.

# use moments in the global environment:
# evaluate_noncentral(c(3,1,2),c(3,4,1),c(4,2,1,3,1,2),'.GlobalEnv')





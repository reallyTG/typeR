library(RcppEigenAD)


### Name: J
### Title: Construct a function to calculate the Jacobian of a function.
### Aliases: J

### ** Examples

## No test: 
# define f as the eigen vectors of its argument X
# calculated using the Eigen library
library(RcppEigenAD)
f<-sourceCppAD('
ADmat f(const ADmat& X)
{
   Eigen::EigenSolver<ADmat> es(X);
   return es.pseudoEigenvectors();
}
')
Jf<-J(f)
X<-matrix(c(1,2,3,4),2,2)
Jmat<-Jf(X)
Jmat # the Jacobian matrix of first derivatives
Jmat[2,3] # the derivative of f(X)[1,2] with respect to X[2,1]
## End(No test)




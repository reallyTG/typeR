library(RcppEigenAD)


### Name: H
### Title: Construct a function to calculate the Hessian of a function.
### Aliases: H

### ** Examples

## No test: 
library(RcppEigenAD)
# define f as the eigen vectors of its argument x
# calculated using the Eigen library
f<-sourceCppAD('
ADmat f(const ADmat& X)
{
   Eigen::EigenSolver<ADmat> es(X);
   return es.pseudoEigenvectors();
}
')
Hf<-H(f)
X<-matrix(c(1,2,3,4),2,2)
Hmat<-Hf(X) 
Hmat # the Hessian matrices of second derivatives stacked column wise
Hmat[3,9] # the second derivative of f(X)[2,1] with respect to X[2,1] and X[1,2]
## End(No test)




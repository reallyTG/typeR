library(RcppEigenAD)


### Name: %.%
### Title: Compose two functions created using either sourceCppAD or '%.%'
###   itself
### Aliases: %.%

### ** Examples

## No test: 
library(RcppEigenAD)
# define a function to calculate the eigen vectors of a matrix
f<-sourceCppAD('
ADmat f(const ADmat& X)
{
  Eigen::EigenSolver<ADmat> es(X);
  return es.pseudoEigenvectors();

}
')
# define function to calculate the inverse of a matrix
g<-sourceCppAD('
ADmat g(const ADmat& X)
{
  return X.inverse(); 
}
')
# compose f and g to produce a functions to calculate the eigenvectors of the inverse of a matrix
h<-f%.%g  #  h = f o g
x<-matrix(c(1,2,3,4),2,2)
x<-x%*%t(x) # positive definite matrix
J(h)(x) # Jacobian of h = f o g
H(h)(x) # Stacked Hessians of h = f o g
# redefine h as a function to directly calculate the eigenvectors of the inverse of a matrix
h<-sourceCppAD('
ADmat h(const ADmat& X)
{
  Eigen::EigenSolver<ADmat> es(X.inverse());
  return es.pseudoEigenvectors();
}
')
# calculate the Jacobian and Hessian of h to compare with previous result
J(h)(x) # Jacobian of h = f o g
H(h)(x) # Stacked Hessians of h = f o g
## End(No test)




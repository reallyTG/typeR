library(RcppEigenAD)


### Name: sourceCppAD
### Title: Construct a function to calculate the Jacobian of a function.
### Aliases: sourceCppAD

### ** Examples

## No test: 
library(RcppEigenAD)
# define a function to calculate sin(cos(x)) where x is a matrix
f<-sourceCppAD('
ADmat f(const ADmat& X)
{
  return X.array().cos().sin();
}
')
x<-matrix(c(1,2,3,4),2,2)
# call it
f(x)
## End(No test)




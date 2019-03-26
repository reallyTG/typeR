library(BayesianGLasso)


### Name: blockGLasso
### Title: Block Gibbs sampler function
### Aliases: blockGLasso

### ** Examples

## No test: 
# Generate true covariance matrix:
s<-.9**toeplitz(0:9)
# Generate multivariate normal distribution:
set.seed(5)
x<-MASS::mvrnorm(n=100,mu=rep(0,10),Sigma=s)
blockGLasso(X=x)
## End(No test)
# Same example with short MCMC chain:
s<-.9**toeplitz(0:9)
set.seed(6)
x<-MASS::mvrnorm(n=100,mu=rep(0,10),Sigma=s)
blockGLasso(X=x,iterations=100,burnIn=100)




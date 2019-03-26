library(psych)


### Name: cortest.bartlett
### Title: Bartlett's test that a correlation matrix is an identity matrix
### Aliases: cortest.bartlett
### Keywords: multivariate

### ** Examples

set.seed(42)   
x <- matrix(rnorm(1000),ncol=10)
r <- cor(x)
cortest.bartlett(r)      #random data don't differ from an identity matrix
data(bfi)
cortest.bartlett(bfi[1:200,1:10])    #not an identity matrix
f3 <- fa(Thurstone,3)
f3r <- f3$resid
cortest.bartlett(f3r,n=213,diag=FALSE)  #incorrect

cortest.bartlett(f3r,n=213,diag=TRUE)  #correct (by default)





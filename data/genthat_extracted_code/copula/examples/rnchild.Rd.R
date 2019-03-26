library(copula)


### Name: rnchild
### Title: Sampling Child 'nacopula's
### Aliases: rnchild
### Keywords: distribution

### ** Examples

## Construct a three-dimensional nested Clayton copula with parameters
## chosen such that the Kendall's tau of the respective bivariate margins
## are 0.2 and 0.5.
theta0 <- copClayton@iTau(.2)
theta1 <- copClayton@iTau(.5)
C3 <- onacopula("C", C(theta0, 1, C(theta1, c(2,3))))
## Sample n random variates V0 ~ F0 (a Gamma(1/theta0,1) distribution)
n <- 1000
V0 <- copClayton@V0(n, theta0)

## Given these variates V0, sample the child copula, that is, the bivariate
## nested Clayton copula with parameter theta1
U23 <- rnchild(C3@childCops[[1]], theta0, V0)
## Don't show: 
stopifnot(dim(rnchild(C3@childCops[[1]], theta0, numeric(0))$U) == c(0,2))
## End(Don't show)
## Now build the three-dimensional vectors of random variates by hand
U1 <- copClayton@psi(rexp(n)/V0, theta0)
U <- cbind(U1, U23$U)

## Plot the vectors of random variates from the three-dimensional nested
## Clayton copula
splom2(U)




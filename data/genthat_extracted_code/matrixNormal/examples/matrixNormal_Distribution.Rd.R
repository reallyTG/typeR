library(matrixNormal)


### Name: matrixNormal_Distribution
### Title: The Matrix Normal Distribution
### Aliases: matrixNormal_Distribution dmatnorm pmatnorm rmatnorm
### Keywords: distribution

### ** Examples

#Data Used
A <- CO2[1:10, 4:5]
M <- cbind(stats::rnorm(10, 435, 296), stats::rnorm(10, 27, 11) )
V <- matrix(c(87, 13, 13, 112), nrow = 2, ncol = 2, byrow = TRUE)
V  #Right covariance matrix (2 x 2), say the covariance between parameters.
U <- I(10) #Block of left-covariance matrix ( 84 x 84), say the covariance between subjects.
#PDF
dmatnorm(A, M, U, V )
dmatnorm(A, M, U, V, use.log = FALSE)

#Generating Probability Lower and Upper Bounds (They're matrices )
Lower <- matrix( rep(-1, 20), ncol = 2)
Upper <- matrix( rep(3, 20), ncol = 2)
Lower; Upper
#The probablity that a randomly chosen matrix A is between Lower and Upper
pmatnorm( Lower, Upper, M, U, V)
#CDF
pmatnorm( Lower = -Inf, Upper, M, U, V)
#entire domain = 1
pmatnorm( Lower = -Inf, Upper = Inf, M, U, V)

#Random generation
M <- cbind(rnorm(3, 435, 296), rnorm(3, 27, 11) )
U <- diag(1, 3)
V <- matrix(c(10, 5 ,5, 3), nrow = 2)
set.seed(123)
rmatnorm(M, U, V)
## Not run: 
##D   #M has a different sample size than U; will return an error.
##D M <- cbind(rnorm(4, 435, 296), rnorm(4, 27, 11) )
##D rmatnorm(M, U, V)
## End(Not run)




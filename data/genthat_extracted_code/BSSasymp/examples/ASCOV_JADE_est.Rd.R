library(BSSasymp)


### Name: ASCOV_JADE_est
### Title: Asymptotic covariance matrix of JADE and FOBI estimates
### Aliases: ASCOV_JADE_est ASCOV_FOBI_est
### Keywords: multivariate

### ** Examples

# source components have t-10-, uniform- and gaussian distribution 
s1 <- rt(1000,10)/sqrt(10/8)
s2 <- runif(1000,-sqrt(3),sqrt(3))
s3 <- rnorm(1000)
S <- cbind(s1,s2,s3)
A <- matrix(rnorm(9),3,3)

X <- S %*% t(A)
round(1000*ASCOV_JADE_est(X)$COV_W,2)
round(1000*ASCOV_FOBI_est(X)$COV_W,2)





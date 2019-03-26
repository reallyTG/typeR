library(OjaNP)


### Name: ojaRCM
### Title: Oja Rank Convariance Matrix
### Aliases: ojaRCM
### Keywords: multivariate nonparametric

### ** Examples

### ----<< Example 1 >>---- : biochem data
data(biochem)
X <- biochem[,1:2]
ojaRCM(X)

# Oja ranks are centered 
# (i.e. they add up to zero), and 
# the following two return the same.
ojaRCM(X)
(1 - 1/nrow(X))*cov(ojaRank(X))



### ----<< Example 2 >>---- : 300 points in R^7 
# The merit of subsampling.
# The following example might take a bit longer:
## Not run: 
##D A <- matrix(c(1,0.5,1,4,2,0.5,-0.5,1,4), ncol = 3)
##D B <- A %x% A;  Sigma  <- (B %*% t(B))[1:7, 1:7]
##D # Sigma is some arbitrary positive definite matrix.
##D set.seed(123)
##D X <- rmvnorm(n = 300, sigma = Sigma) 
##D 
##D cov2cor(Sigma) # the true correlation matrix
##D cor(X)  # Bravais-Pearson correlation
##D cov2cor(solve(ojaRCM(X))
##D # correlation estimate based on Oja ranks 
##D # The subsampling fraction in this example
##D # is p = 1.081438e-10.
##D # Yet it returns a sensible estimate.
## End(Not run)




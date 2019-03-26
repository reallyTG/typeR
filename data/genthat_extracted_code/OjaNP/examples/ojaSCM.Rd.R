library(OjaNP)


### Name: ojaSCM
### Title: Oja Sign Convariance Matrix
### Aliases: ojaSCM
### Keywords: multivariate nonparametric

### ** Examples


### ----<< Example 1 >>---- : biochem data
data(biochem)
X <- biochem[,1:2]
ojaSCM(X)

# Oja signs are correctly centered 
# (i.e. they add up to zero) when 
# computed w.r.t. the Oja median
# Hence the following return the same,
ojaSCM(X, center = "ojaMedian", alg = "exact")
(1 - 1/nrow(X))*cov(ojaSign(X, alg = "exact"))
# but the following not.
ojaSCM(X, center = "colMean")
(1 - 1/nrow(X))*cov(ojaSign(X, center = "colMean"))



### ----<< Example 2 >>---- : 300 points in R^7 
# The merit of subsampling.
# The following example might take a bit longer:
## Not run: 
##D A <- matrix(c(1,0.5,1,4,2,0.5,-0.5,1,4), ncol = 3)
##D B <- A %x% A;  Sigma  <- (B %*% t(B))[1:7, 1:7]
##D # Sigma is some arbitrary positive definite matrix.
##D set.seed(123)
##D X <- rmvnorm(n=300,sigma=Sigma) 
##D 
##D cov2cor(Sigma) # the true correlation matrix
##D cor(X)  # Bravais-Pearson correlation
##D cov2cor(solve(ojaSCM(X, center = "colMean")))
##D # correlation estimate based on Oja signs 
##D # The subsampling fraction in this example
##D # is p = 4.542038e-09.
##D # Yet it returns a sensible estimate.
## End(Not run)




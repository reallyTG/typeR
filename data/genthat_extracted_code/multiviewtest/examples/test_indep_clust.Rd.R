library(multiviewtest)


### Name: test_indep_clust
### Title: Pseudo likelihood ratio test for dependent clusterings
### Aliases: test_indep_clust

### ** Examples

set.seed(1)
n <- 50
sig <- 2
p <- 2
K <- 3
mu1 <- cbind(c(2, 0), c(0, 2),  c(2, -2), c(-2, 0), c(0, -2), c(-2, 2))
mu2 <- cbind(c(-2, 0), c(0, -2), c(-2, 2), c(2, 0), c(0, 2), c(2, -2))
# Generates two-view data where the clusters are independent.
x1 <- list(matrix(sig* rnorm(n*p), n, p) + t(mu1)[sample(1:K, n, replace=TRUE), ],
         matrix(sig * rnorm(n*p), n, p) + t(mu2)[sample(1:K, n, replace=TRUE), ])

# Generate two-view data where the clusters are identical.
n <- 70
cl <- sample(1:K, n, replace=TRUE)
x2 <- list(matrix(sig* rnorm(n*p), n, p) + t(mu1)[cl, ],
         matrix(sig * rnorm(n*p), n, p) + t(mu2)[cl, ])

# Run the function on independent data views; we do not reject the null hypothesis.
 # By default, not specifying K1 and K2 means the number of clusters
 # to use in the test in each view is chosen via BIC.
 # Covariance matrix model specified is shared sigma^2 I covariance matrix in view 1
 # and shared diagonal covariance matrix in view 2.
 # B specifies the number of permutations to do for the permutation test.
 # Covariance matrix model specified for initialization
 # is shared sigma^2 I covariance matrix in view 1
indep1 <- test_indep_clust(x1,model1="EII", model2="EEI",
init1="EII", B=52)
# The estimated cluster parameters in view 1
indep1$modelfit1$parameters
# The cluster assignments in view 2
indep1$modelfit2$classification

# Run the function on identical data views; we reject the null hypothesis
# We specify the number of clusters in each view to use in the test.
# Covariance matrix model specified is shared covariance matrix in view 1
# and shared diagonal covariance matrix in view 2.
# See mclust documentation for more covariance model specification options.
identical2 <- test_indep_clust(x2,model1="EEE", model2="EEI", K1=2, K2=3, B=51)
# P-value
identical2$pval





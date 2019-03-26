library(multiviewtest)


### Name: test_indep_clust_subset
### Title: Pseudo likelihood ratio test for independence of clusterings
### Aliases: test_indep_clust_subset

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
n <- 71
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
 # Estimates Gaussian mixture model parameters on x1[[1]] and x1[[2]],
 # and compares the estimated clusterings on the subsetted data
 # x1[[1]][2:48, ] and x1[[1]][2:48, ].
indep1 <- test_indep_clust_subset(x1,model1="EII", model2="EEI",
subset1=2:48, subset2=2:48, init1="EII", B=51)
# The estimated cluster parameters in view 1
indep1$modelfit1$parameters
# The cluster assignments in view 2
indep1$modelfit2$classification






library(HHG)


### Name: HHG
### Title: Heller-Heller-Gorfine Tests of Independence and Equality of
###   Distributions
### Aliases: hhg.test hhg.test.k.sample hhg.test.2.sample

### ** Examples

## Not run: 
##D ## 1. The test of independence
##D 
##D ## 1.1. A non-null univariate example
##D 
##D ## Generate some data from the Circle example
##D n = 50
##D X = hhg.example.datagen(n, 'Circle')
##D plot(X[1,], X[2,])
##D 
##D ## Compute distance matrices, on which the HHG test will be based
##D Dx = as.matrix(dist((X[1,]), diag = TRUE, upper = TRUE))
##D Dy = as.matrix(dist((X[2,]), diag = TRUE, upper = TRUE))
##D 
##D ## Compute HHG statistics, and p-values using 1000 random permutations
##D set.seed(1) #set the seed for the random permutations
##D hhg = hhg.test(Dx, Dy, nr.perm = 1000)
##D 
##D ## Print the  statistics and their permutation p-value
##D 
##D hhg
##D 
##D ## 1.2. A null univariate example
##D 
##D n = 50
##D X = hhg.example.datagen(n, '4indclouds') 
##D 
##D Dx = as.matrix(dist((X[1,]), diag = TRUE, upper = TRUE))
##D Dy = as.matrix(dist((X[2,]), diag = TRUE, upper = TRUE))
##D 
##D set.seed(1) #set the seed for the random permutations
##D hhg = hhg.test(Dx, Dy, nr.perm = 1000)
##D 
##D hhg
##D 
##D ## 1.3. A multivariate example
##D library(MASS)
##D 
##D n = 50
##D p = 5
##D x = t(mvrnorm(n, rep(0, p), diag(1, p)))
##D y = log(x ^ 2)
##D Dx = as.matrix(dist((t(x)), diag = TRUE, upper = TRUE))
##D Dy = as.matrix(dist((t(y)), diag = TRUE, upper = TRUE))
##D 
##D set.seed(1) #set the seed for the random permutations
##D hhg = hhg.test(Dx, Dy, nr.perm = 1000)
##D 
##D hhg
##D 
##D ## 2. The k-sample test
##D 
##D n = 50
##D D = hhg.example.datagen(n, 'FourClassUniv')
##D Dx = as.matrix(dist(D$x, diag = TRUE, upper = TRUE))
##D 
##D hhg = hhg.test.k.sample(Dx, D$y, nr.perm = 1000)
##D 
##D hhg
## End(Not run)





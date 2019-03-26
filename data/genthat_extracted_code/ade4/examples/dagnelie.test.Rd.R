library(ade4)


### Name: dagnelie.test
### Title: Dagnelie multinormality test
### Aliases: dagnelie.test

### ** Examples


 # Example 1: 2 variables, n = 100
 n <- 100; p <- 2
 mat <- matrix(rnorm(n*p), n, p)
 (out <- dagnelie.test(mat))

 # Example 2: 10 variables, n = 50
 n <- 50; p <- 10
 mat <- matrix(rnorm(n*p), n, p)
 (out <- dagnelie.test(mat))

 # Example 3: 10 variables, n = 100
 n <- 100; p <- 10
 mat <- matrix(rnorm(n*p), n, p)
 (out <- dagnelie.test(mat))
 # Plot a histogram of the Mahalanobis distances
hist(out$D)

 # Example 4: 10 lognormal random variables, n = 50
 n <- 50; p <- 10
 mat <- matrix(round(exp(rnorm((n*p), mean = 0, sd = 2.5))), n, p)
 (out <- dagnelie.test(mat))
 # Plot a histogram of the Mahalanobis distances
 hist(out$D)





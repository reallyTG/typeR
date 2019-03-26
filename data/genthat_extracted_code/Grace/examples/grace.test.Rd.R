library(Grace)


### Name: grace.test
### Title: Graph-Constrained Hypothesis Testing Procedure
### Aliases: grace.test

### ** Examples

set.seed(120)
n <- 100
p <- 200

L <- matrix(0, nrow = p, ncol = p)
for(i in 1:10){
	L[((i - 1) * p / 10 + 1), ((i - 1) * p / 10 + 1):(i * (p / 10))] <- -1
}
diag(L) <- 0
ind <- lower.tri(L, diag = FALSE)
L[ind] <- t(L)[ind]
diag(L) <- -rowSums(L)

beta <- c(rep(1, 10), rep(0, p - 10))

Sigma <- solve(L + 0.1 * diag(p))
sigma.error <- sqrt(t(beta) %*% Sigma %*% beta) / 2

X <- mvrnorm(n, mu = rep(0, p), Sigma = Sigma)
Y <- c(X %*% beta + rnorm(n, sd = sigma.error))

grace.test.result <- grace.test(Y, X, L, lambda.L = c(0.08, 0.12),
                                lambda.2 = c(0.08, 0.12))
mean(grace.test.result$pvalue[beta == 0] < 0.05)

grace.test.result$group.test(1:2)
grace.test.result$group.test(3:50)
grace.test.result$group.test(11:100)
grace.test.result$group.test(1:5, method = "max")

grace.test.result <- grace.test(Y, X, L, lambda.L = 0.08,
                                lambda.2 = 0.08, C = "cv")
mean(grace.test.result$pvalue[beta == 0] < 0.05)




library(nicheROVER)


### Name: rwish
### Title: Random draws from a Wishart (or Inverse-Wishart) distribution.
### Aliases: rwish

### ** Examples

d <- 4 # number of dimensions
nu <- 7 # degrees of freedom
Psi <- crossprod(matrix(rnorm(d^2), d, d)) # scale matrix
n <- 1e4

Sigma <- rwish(n, Psi, nu)

# for any vector a, X = (a' Sigma a) has a const * chi^2 distribution
a <- rnorm(d)
X <- apply(Sigma, 3, function(S) crossprod(a, S %*% a))
const <- a %*% Psi %*% a

hist(X, breaks = 100, freq = FALSE,
    main = parse(text = "\"Histogram of \"*X==a*minute*Sigma*a"),
    xlab = parse(text = "X==a*minute*Sigma*a"))
curve(dchisq(x/const, df = nu)/const,
     from = min(X), to = max(X), col = "red", add = TRUE)




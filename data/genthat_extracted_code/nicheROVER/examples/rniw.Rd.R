library(nicheROVER)


### Name: rniw
### Title: Random draws from a Normal-Inverse-Wishart distribution.
### Aliases: rniw

### ** Examples

d <- 4 # number of dimensions
nu <- 7 # degrees of freedom
Psi <- crossprod(matrix(rnorm(d^2), d, d)) # scale
lambda <- rnorm(d)
kappa <- 2
n <- 1e4

niw.sim <- rniw(n, lambda, kappa, Psi, nu)

# diagonal elements of Sigma^{-1} are const * chi^2
S <- apply(niw.sim$Sigma, 3, function(M) diag(solve(M)))

ii <- 2
const <- solve(Psi)[ii,ii]
hist(S[ii,], breaks = 100, freq = FALSE,
    main = parse(text = paste0("\"Histogram of \"*(Sigma^{-1})[", ii,ii,"]")),
    xlab = parse(text = paste0("(Sigma^{-1})[", ii,ii,"]")))
curve(dchisq(x/const, df = nu)/const,
     from = min(S[ii,]), to = max(S[ii,]), col = "red", add = TRUE)

# elements of mu have a t-distribution
mu <- niw.sim$mu

ii <- 4
const <- sqrt(Psi[ii,ii]/(kappa*(nu-d+1)))
hist(mu[,ii], breaks = 100, freq = FALSE,
    main = parse(text = paste0("\"Histogram of \"*mu[", ii, "]")),
    xlab = parse(text = paste0("mu[", ii, "]")))
curve(dt((x-lambda[ii])/const, df = nu-d+1)/const, add = TRUE, col = "red")




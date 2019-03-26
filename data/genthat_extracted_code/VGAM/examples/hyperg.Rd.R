library(VGAM)


### Name: hyperg
### Title: Hypergeometric Family Function
### Aliases: hyperg
### Keywords: models regression

### ** Examples

nn <- 100
m <- 5  # Number of white balls in the population
k <- rep(4, len = nn)  # Sample sizes
n <- 4  # Number of black balls in the population
y  <- rhyper(nn = nn, m = m, n = n, k = k)
yprop <- y / k  # Sample proportions

# N is unknown, D is known. Both models are equivalent:
fit <- vglm(cbind(y,k-y) ~ 1, hyperg(D = m), trace = TRUE, crit = "c")
fit <- vglm(yprop ~ 1, hyperg(D = m), weight = k, trace = TRUE, crit = "c")

# N is known, D is unknown. Both models are equivalent:
fit <- vglm(cbind(y, k-y) ~ 1, hyperg(N = m+n), trace = TRUE, crit = "l")
fit <- vglm(yprop ~ 1, hyperg(N = m+n), weight = k, trace = TRUE, crit = "l")

coef(fit, matrix = TRUE)
Coef(fit)  # Should be equal to the true population proportion
unique(m / (m+n))  # The true population proportion
fit@extra
head(fitted(fit))
summary(fit)




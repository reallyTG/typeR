library(tsBSS)


### Name: vSOBI
### Title: A Variant of SOBI for Blind Source Separation
### Aliases: vSOBI vSOBI.default vSOBI.ts
### Keywords: multivariate ts

### ** Examples

library(stochvol)
n <- 10000
A <- matrix(rnorm(9), 3, 3)

# simulate SV models
s1 <- svsim(n, mu = -10, phi = 0.8, sigma = 0.1)$y
s2 <- svsim(n, mu = -10, phi = 0.9, sigma = 0.2)$y
s3 <- svsim(n, mu = -10, phi = 0.95, sigma = 0.4)$y

# create a daily time series
X <- ts(cbind(s1, s2, s3) %*% t(A), end = c(2015, 338), frequency = 365.25)


res <- vSOBI(X)
res
coef(res)
plot(res)
head(bss.components(res))

MD(res$W, A) # Minimum Distance Index, should be close to zero




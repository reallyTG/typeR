library(rvinecopulib)


### Name: rosenblatt
### Title: (Inverse) Rosenblatt transform
### Aliases: rosenblatt inverse_rosenblatt inverse_rosenblatt

### ** Examples

# simulate data with some dependence
x <- replicate(3, rnorm(200))
x[, 2:3] <- x[, 2:3] + x[, 1]
pairs(x)

# estimate a vine distribution model
fit <- vine(x, copula_controls = list(family_set = "par"))

# transform into independent uniforms
u <- rosenblatt(x, fit)
pairs(u)

# inversion
pairs(inverse_rosenblatt(u, fit))




library(episode)


### Name: imd
### Title: Integral Matching Design
### Aliases: imd

### ** Examples

set.seed(123)
# Michaelis-Menten system with two 0-rate reactions
A <- matrix(c(1, 1, 0, 0,
              0, 0, 1, 0,
              0, 0, 1, 0,
              0, 1, 0, 0,
              0, 0, 0, 1), ncol = 4, byrow = TRUE)
B <- matrix(c(0, 0, 1, 0,
              1, 1, 0, 0,
              1, 0, 0, 1,
              0, 0, 0, 1,
              0, 0, 1, 0), ncol = 4, byrow = TRUE)
k <- c(2.1, 2.25, 1.5, 0, 0); x0 <- c(E = 8, S = 10, ES = 1.5, P = 1.5)
Time <- seq(0, 10, by = 1)

# Simulate data, in second context the catalytic rate has been doubled
contexts <- cbind(1, c(1, 1, 2, 1, 1))
m <- mak(A, B, r = reg(contexts = contexts))
y <- numsolve(m, c(Time, Time), cbind(x0, x0 + c(2, -2, 0, 0)), contexts * k)
y[, -1] <- y[, -1] + matrix(rnorm(prod(dim(y[, -1])), sd = .5), nrow = nrow(y))

# Get the design matrix used in integral matching
d <- imd(m, opt(y))
head(d$X[[1]])

# Compare with glmnet
lasso <- glmnet::glmnet(x = d$X[[1]], y = d$Y, intercept = FALSE, lower.limits = 0)
a <- aim(m, opt(y, nlambda = 100), adapts = "scales")
all.equal(lasso$beta, a$params$rate)





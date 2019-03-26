library(MultiRobust)


### Name: MR.quantile
### Title: Multiply Robust Estimation of the Marginal Quantile
### Aliases: MR.quantile

### ** Examples

# Simulated data set
set.seed(123)
n <- 400
gamma0 <- c(1, 2, 3)
alpha0 <- c(-0.8, -0.5, 0.3)
X <- runif(n, min = -2.5, max = 2.5)
X.2 <- X ^ 2
exp.X <- exp(X)
p.miss <- 1 / (1 + exp(alpha0[1] + alpha0[2] * X + alpha0[3] * X.2))
R <- rbinom(n, size = 1, prob = 1 - p.miss)
a.x <- gamma0[1] + gamma0[2] * X + gamma0[3] * exp.X
Y <- rnorm(n, a.x, sd = sqrt(4 * X.2 + 2))
dat <- data.frame(X, X.2, exp.X, Y)
dat[R == 0, 4] <- NA

# Define the outcome regression models and missingness probability models
imp1 <- def.glm(formula = Y ~ X + exp.X, family = gaussian)
imp2 <- def.glm(formula = Y ~ X + X.2, family = gaussian)
mis1 <- def.glm(formula = R ~ X + X.2, family = binomial(link = logit))
mis2 <- def.glm(formula = R ~ X + exp.X, family = binomial(link = cloglog))
est <- MR.quantile(tau = 0.25, imp.model = list(imp1, imp2),
                   mis.model = list(mis1, mis2), L = 5, data = dat)




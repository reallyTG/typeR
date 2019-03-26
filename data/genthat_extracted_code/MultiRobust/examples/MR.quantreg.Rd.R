library(MultiRobust)


### Name: MR.quantreg
### Title: Multiply Robust Estimation of the Quantile Regression
###   Coefficients
### Aliases: MR.quantreg

### ** Examples

# Missing covariate and missing response simultaneously
# Simulated data set
set.seed(123)
n <- 400
gamma0 <- c(1, 2, 3)
alpha0 <- c(-0.8, -0.5, 0.3)
S <- runif(n, min = -2.5, max = 2.5) # auxiliary information
S.2 <- S ^ 2
X1 <- rbinom(n, size = 1, prob = 0.5) # covariate X1
X2 <- rexp(n) # covariate X2
p.obs <- 1 / (1 + exp(alpha0[1] + alpha0[2] * S + alpha0[3] * S.2)) # missingness probability
R <- rbinom(n, size = 1, prob = p.obs)
a.x <- gamma0[1] + gamma0[2] * X1 + gamma0[3] * X2
Y <- rnorm(n, a.x)
dat <- data.frame(S, X1, X2, Y)
dat[R == 0, c(2, 4)] <- NA # X1 and Y are missing

# Estimating quantile regression coefficients
# quantile regression model of interest
reg <- def.quantreg(formula = Y ~ X1 + X2)
# imputation models for X1
impX1.1 <- def.glm(formula = X1 ~ S, family = binomial(link = logit))
impX1.2 <- def.glm(formula = X1 ~ S + X2, family = binomial(link = cloglog))
# imputation models for Y
impY.1 <- def.glm(formula = Y ~ S, family = gaussian)
impY.2 <- def.glm(formula = Y ~ S + X2, family = gaussian)
# missingness probability models
mis1 <- def.glm(formula = R ~ S + S.2, family = binomial(link = logit))
mis2 <- def.glm(formula = R ~ S.2, family = binomial(link = cloglog))

imp1 <- list(impX1.1, impY.1) # 1st set of imputation models for X1 and Y
imp2 <- list(impX1.2, impY.2) # 2nd set of imputation models for X1 and Y
imp3 <- list(impX1.1, impY.2) # 3rd set of imputation models for X1 and Y
imp4 <- list(impX1.2, impY.1) # 4th set of imputation models for X1 and Y

results <- MR.quantreg(quantreg.model = reg, imp.model = list(imp1, imp2, imp3, imp4),
                       mis.model = list(mis1, mis2), L = 5, data = dat)




library(mimi)


### Name: mimi
### Title: mimi (Main effects and Interactions in Mixed and Incomplete data
###   frames) The method estimates main effects (group effects or effects
###   of covariates) and interactions in mixed data frames with missing
###   values. The results can be used for imputation or interpretation
###   purposes.
### Aliases: mimi

### ** Examples

n = 6; p = 2
y1 <- matrix(rnorm(mean = 0, n * p), nrow = n)
y2 <- matrix(rnorm(mean = 0, n * p), nrow = n)
y3 <- matrix(rnorm(mean = 2, n * p), nrow = n)
y <- cbind(matrix(rnorm(mean = c(y1), n * p), nrow = n),
           matrix(rbinom(n * p, prob = c(exp(y2)/(1+exp(y2))), size = 1), nrow = n),
           matrix(rpois(n * p, lambda = c(exp(y3))), nrow = n))
var.type <- c(rep("gaussian", p), rep("binary", p), rep("poisson", p))
idx_NA <- sample(1:(3 * n * p), size = round(0.01 * 3 * n * p))
y[idx_NA] <- NA
res <- mimi(y, model = "low-rank", var.type = var.type, lambda1 = 1, maxit=5)




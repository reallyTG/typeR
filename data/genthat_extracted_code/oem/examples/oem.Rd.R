library(oem)


### Name: oem
### Title: Orthogonalizing EM
### Aliases: oem

### ** Examples

set.seed(123)
n.obs <- 1e4
n.vars <- 50

true.beta <- c(runif(15, -0.25, 0.25), rep(0, n.vars - 15))

x <- matrix(rnorm(n.obs * n.vars), n.obs, n.vars)
y <- rnorm(n.obs, sd = 3) + x %*% true.beta

fit <- oem(x = x, y = y, 
           penalty = c("lasso", "grp.lasso", "sparse.grp.lasso"), 
           groups = rep(1:10, each = 5))

layout(matrix(1:3, ncol = 3))
plot(fit)
plot(fit, which.model = 2)
plot(fit, which.model = "sparse.grp.lasso")

# the oem package has support for
# sparse design matrices

library(Matrix)

xs <- rsparsematrix(n.obs * 25, n.vars * 2, density = 0.01)
ys <- rnorm(n.obs * 25, sd = 3) + as.vector(xs %*% c(true.beta, rep(0, n.vars)) )
x.dense <- as.matrix(xs)

system.time(fit <- oem(x = x.dense, y = ys, 
                       penalty = c("lasso", "grp.lasso"), 
                       groups = rep(1:20, each = 5), intercept = FALSE,
                       standardize = FALSE))

system.time(fits <- oem(x = xs, y = ys, 
                        penalty = c("lasso", "grp.lasso"), 
                        groups = rep(1:20, each = 5), intercept = FALSE, 
                        standardize = FALSE, lambda = fit$lambda))
                        
max(abs(fit$beta[[1]] - fits$beta[[1]]))
max(abs(fit$beta[[2]] - fits$beta[[2]]))

# logistic
y <- rbinom(n.obs, 1, prob = 1 / (1 + exp(-x %*% true.beta)))

system.time(res <- oem(x, y, intercept = FALSE, 
                       penalty = c("lasso", "sparse.grp.lasso", "mcp"), 
                       family = "binomial", 
                       groups = rep(1:10, each = 5),
                       nlambda = 10,
                       irls.tol = 1e-3, tol = 1e-8))

layout(matrix(1:3, ncol = 3))
plot(res)
plot(res, which.model = 2)
plot(res, which.model = "mcp")


# sparse design matrix
xs <- rsparsematrix(n.obs * 2, n.vars, density = 0.01)
x.dense <- as.matrix(xs)
ys <- rbinom(n.obs * 2, 1, prob = 1 / (1 + exp(-x %*% true.beta)))

system.time(res.gr <- oem(x.dense, ys, intercept = FALSE, 
                          penalty = "grp.lasso", 
                          family = "binomial", 
                          nlambda = 10,
                          groups = rep(1:5, each = 10), 
                          irls.tol = 1e-3, tol = 1e-8))
                          
system.time(res.gr.s <- oem(xs, ys, intercept = FALSE, 
                            penalty = "grp.lasso", 
                            family = "binomial", 
                            nlambda = 10,
                            groups = rep(1:5, each = 10), 
                            irls.tol = 1e-3, tol = 1e-8))
                            
max(abs(res.gr$beta[[1]] - res.gr.s$beta[[1]]))





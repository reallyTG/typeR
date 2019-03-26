library(oem)


### Name: xval.oem
### Title: Fast cross validation for Orthogonalizing EM
### Aliases: xval.oem

### ** Examples

set.seed(123)
n.obs <- 1e4
n.vars <- 100

true.beta <- c(runif(15, -0.25, 0.25), rep(0, n.vars - 15))

x <- matrix(rnorm(n.obs * n.vars), n.obs, n.vars)
y <- rnorm(n.obs, sd = 3) + x %*% true.beta

system.time(fit <- oem(x = x, y = y, 
                       penalty = c("lasso", "grp.lasso"), 
                       groups = rep(1:20, each = 5)))
                       
system.time(xfit <- xval.oem(x = x, y = y, 
                             penalty = c("lasso", "grp.lasso"), 
                             groups = rep(1:20, each = 5)))
                             
system.time(xfit2 <- xval.oem(x = x, y = y, 
                              penalty = c("lasso", "grp.lasso",
                                          "mcp",       "scad", 
                                          "mcp.net",   "scad.net",
                                          "grp.lasso", "grp.lasso.net",
                                          "grp.mcp",   "grp.scad",
                                          "sparse.grp.lasso"), 
                              groups = rep(1:20, each = 5)))





library(oem)


### Name: oem.xtx
### Title: Orthogonalizing EM with precomputed XtX
### Aliases: oem.xtx

### ** Examples

set.seed(123)
n.obs <- 1e4
n.vars <- 100

true.beta <- c(runif(15, -0.25, 0.25), rep(0, n.vars - 15))

x <- matrix(rnorm(n.obs * n.vars), n.obs, n.vars)
y <- rnorm(n.obs, sd = 3) + x %*% true.beta

fit <- oem(x = x, y = y, 
           penalty = c("lasso", "elastic.net", 
                        "ols", 
                        "mcp",       "scad", 
                        "mcp.net",   "scad.net",
                        "grp.lasso", "grp.lasso.net",
                        "grp.mcp",   "grp.scad",
                        "sparse.grp.lasso"), 
           standardize = FALSE, intercept = FALSE,
           groups = rep(1:20, each = 5))
           
xtx <- crossprod(x) / n.obs
xty <- crossprod(x, y) / n.obs

fit.xtx <- oem.xtx(xtx = xtx, xty = xty, 
                   penalty = c("lasso", "elastic.net", 
                               "ols", 
                               "mcp",       "scad", 
                               "mcp.net",   "scad.net",
                               "grp.lasso", "grp.lasso.net",
                               "grp.mcp",   "grp.scad",
                               "sparse.grp.lasso"), 
                   groups = rep(1:20, each = 5))    
                   
max(abs(fit$beta[[1]][-1,] - fit.xtx$beta[[1]]))
max(abs(fit$beta[[2]][-1,] - fit.xtx$beta[[2]]))       

layout(matrix(1:2, ncol = 2))
plot(fit.xtx)
plot(fit.xtx, which.model = 2)





library(MGLM)


### Name: path
### Title: Extract path
### Aliases: path path,MGLMtune-method

### ** Examples

library("MGLM")
dist <- "DM"
n <- 100
p <- 10
d <- 5
set.seed(118)
m <- rbinom(n, 200, 0.8)
X <- matrix(rnorm(n * p), n, p)
alpha <- matrix(0, p, d)
alpha[c(1, 3, 5), ] <- 1
Alpha <- exp(X %*% alpha)
Y <- rdirmn(size = m, alpha = Alpha)
select <- MGLMtune(Y ~ 0 + X, dist = "DM", penalty = "nuclear", 
ngridpt = 10, display = FALSE)
select_path <- path(select)




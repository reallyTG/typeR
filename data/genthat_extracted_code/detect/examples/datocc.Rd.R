library(detect)


### Name: datocc
### Title: Simulated example for occupancy model
### Aliases: datocc
### Keywords: datasets

### ** Examples

data(datocc)
str(datocc)
## Not run: 
##D ## simulation
##D n <- 1000
##D set.seed(1234)
##D x1 <- runif(n, -1, 1)
##D x2 <- as.factor(rbinom(n, 1, 0.5))
##D x3 <- rnorm(n)
##D x4 <- rnorm(n)
##D beta <- c(0.6, 0.5)
##D theta <- c(0.4, -0.5, 0.3)
##D X <- model.matrix(~ x1)
##D Z <- model.matrix(~ x1 + x3)
##D mu <- drop(X %*% beta)
##D nu <- drop(Z %*% theta)
##D p.occ <- binomial("cloglog")$linkinv(mu)
##D p.det <- binomial("logit")$linkinv(nu)
##D Y <- rbinom(n, 1, p.occ)
##D W <- rbinom(n, 1, Y * p.det)
##D datocc <- data.frame(Y, W, x1, x2, x3, x4, p.occ, p.det)
## End(Not run)




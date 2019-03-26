library(FDboost)


### Name: FDboostLSS
### Title: Model-based Gradient Boosting for Functional GAMLSS
### Aliases: FDboostLSS
### Keywords: models, nonlinear

### ** Examples

########### simulate Gaussian scalar-on-function data
n <- 500 ## number of observations
G <- 120 ## number of observations per functional covariate
set.seed(123) ## ensure reproducibility
z <- runif(n) ## scalar covariate
z <- z - mean(z)
s <- seq(0, 1, l=G) ## index of functional covariate
## generate functional covariate
if(require(splines)){
   x <- t(replicate(n, drop(bs(s, df = 5, int = TRUE) %*% runif(5, min = -1, max = 1))))
}else{
  x <- matrix(rnorm(n*G), ncol = G, nrow = n)
}
x <- scale(x, center = TRUE, scale = FALSE) ## center x per observation point

mu <- 2 + 0.5*z + (1/G*x) %*% sin(s*pi)*5 ## true functions for expectation
sigma <- exp(0.5*z - (1/G*x) %*% cos(s*pi)*2) ## for standard deviation

y <- rnorm(mean = mu, sd = sigma, n = n) ## draw respone y_i ~ N(mu_i, sigma_i)

## save data as list containing s as well 
dat_list <- list(y = y, z = z, x = I(x), s = s)

## model fit with noncyclic algorithm assuming Gaussian location scale model 
m_boost <- FDboostLSS(list(mu = y ~ bols(z, df = 2) + bsignal(x, s, df = 2, knots = 16), 
                           sigma = y ~ bols(z, df = 2) + bsignal(x, s, df = 2, knots = 16)), 
                           timeformula = NULL, data = dat_list, method = "noncyclic")
summary(m_boost)

## Not run: 
##D  if(require(gamboostLSS)){
##D   ## find optimal number of boosting iterations on a grid in 1:1000
##D   ## using 5-fold bootstrap
##D   ## takes some time, easy to parallelize on Linux
##D   set.seed(123) 
##D   cvr <- cvrisk(m_boost, folds = cv(model.weights(m_boost[[1]]), B = 5),
##D                 grid = 1:1000, trace = FALSE)
##D   ## use model at optimal stopping iterations 
##D   m_boost <- m_boost[mstop(cvr)] ## 832
##D    
##D   ## plot smooth effects of functional covariates for mu and sigma
##D   par(mfrow = c(1,2))
##D   plot(m_boost$mu, which = 2, ylim = c(0,5))
##D   lines(s, sin(s*pi)*5, col = 3, lwd = 2)
##D   plot(m_boost$sigma, which = 2, ylim = c(-2.5,2.5))
##D   lines(s, -cos(s*pi)*2, col = 3, lwd = 2)
##D  }
## End(Not run)




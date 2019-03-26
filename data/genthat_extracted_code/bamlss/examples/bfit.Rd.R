library(bamlss)


### Name: bfit
### Title: Fit BAMLSS with Backfitting
### Aliases: bfit bfit_iwls bfit_iwls_Matrix bfit_iwls_lm bfit_iwls_optim
###   bfit_lm bfit_optim bfit_glmnet
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulated data example illustrating
##D ## how to call the optimizer function.
##D ## This is done internally within
##D ## the setup of function bamlss().
##D d <- GAMart(n = 200)
##D f <- num ~ s(x1) + s(x2) + s(x3)
##D bf <- bamlss.frame(f, data = d, family = "gaussian")
##D opt <- with(bf, bfit(x, y, family))
##D print(str(opt))
##D 
##D ## Same with bamlss().
##D b <- bamlss(f, data = d, family = "gaussian", sampler = FALSE)
##D plot(b)
##D summary(b)
##D 
##D ## Use of different updating function.
##D b <- bamlss(f, data = d, family = "gaussian",
##D   sampler = FALSE, update = bfit_lm)
##D plot(b)
##D 
##D ## Use mgcv gam() function for updating.
##D b <- bamlss(f, data = d, family = "gaussian",
##D   sampler = FALSE, mgcv = TRUE)
##D plot(b)
##D 
##D ## Special smooth constructor including updating/sampler
##D ## function for nonlinear Gompertz curves.
##D ## Note: element special.npar is needed here since this
##D ##       function has 3 parameters but the design matrix only
##D ##       one column!
##D smooth.construct.gc.smooth.spec <- function(object, data, knots) 
##D {
##D   object$X <- matrix(as.numeric(data[[object$term]]), ncol = 1)
##D   center <- if(!is.null(object$xt$center)) {
##D     object$xt$center
##D   } else FALSE
##D   object$by.done <- TRUE
##D   if(object$by != "NA")
##D     stop("by variables not supported!")
##D   object$fit.fun <- function(X, b, ...) {
##D     f <- b[1] * exp(-b[2] * exp(-b[3] * drop(X)))
##D     if(center)
##D       f <- f - mean(f)
##D     f
##D   }
##D   object$update <- bfit_optim
##D   object$propose <- GMCMC_slice
##D   object$prior <- function(b) { sum(dnorm(b, sd = 1000, log = TRUE)) }
##D   object$fixed <- TRUE
##D   object$state$parameters <- c("b1" = 0, "b2" = 0.5, "b3" = 0.1)
##D   object$state$fitted.values <- rep(0, length(object$X))
##D   object$state$edf <- 3
##D   object$special.npar <- 3 ## Important!
##D   class(object) <- c("gc.smooth", "no.mgcv", "special")
##D   object
##D }
##D 
##D ## Work around for the "prediction matrix" of a growth curve.
##D Predict.matrix.gc.smooth <- function(object, data, knots) 
##D {
##D   X <- matrix(as.numeric(data[[object$term]]), ncol = 1)
##D   X
##D }
##D 
##D ## Heteroscedastic growth curve data example.
##D set.seed(123)
##D 
##D d <- data.frame("time" = 1:30)
##D d$y <- 2 + 1 / (1 + exp(0.5 * (15 - d$time))) +
##D   rnorm(30, sd = exp(-4 + 0.1 * d$time))
##D 
##D ## Special model terms must be called with s2()!
##D f <- list(
##D   "mu" = y ~ s2(time, bs = "gc"),
##D   "sigma" = ~ s(time)
##D )
##D 
##D ## Fit model with special model term.
##D b <- bamlss(f, data = d,
##D   optimizer = bfit, sampler = GMCMC)
##D 
##D ## Plot the fitted curves.
##D plot(b)
##D 
##D ## Predict with special model term.
##D nd <- data.frame("time" = seq(1, 30, length = 100))
##D p <- predict(b, newdata = nd, model = "mu", FUN = c95)
##D plot(d, ylim = range(c(d$y, p)))
##D matplot(nd$time, p, type = "l",
##D   lty = c(2, 1, 2), col = "black", add = TRUE)
## End(Not run)




library(hetGP)


### Name: update.homGP
### Title: Fast 'homGP'-update
### Aliases: update.homGP

### ** Examples

## Not run: 
##D ##------------------------------------------------------------
##D ## Example : Sequential Homoskedastic GP modeling 
##D ##------------------------------------------------------------
##D set.seed(42)
##D 
##D ## Spatially varying noise function
##D noisefun <- function(x, coef = 1){
##D   return(coef * (0.05 + sqrt(abs(x)*20/(2*pi))/10))
##D }
##D 
##D nvar <- 1
##D n <- 10
##D X <- matrix(seq(0, 2 * pi, length=n), ncol = 1)
##D mult <- sample(1:10, n)
##D X <- rep(X, mult)
##D Z <- sin(X) + rnorm(length(X), sd = noisefun(X))
##D 
##D testpts <- matrix(seq(0, 2*pi, length = 10*n), ncol = 1)
##D model <- model_init <- mleHomGP(X = X, Z = Z,
##D                                 lower = rep(0.1, nvar), upper = rep(50, nvar))
##D preds <- predict(x = testpts, object = model_init) 
##D plot(X, Z)
##D lines(testpts, preds$mean, col = "red")
##D 
##D 
##D nsteps <- 10
##D for(i in 1:nsteps){
##D   newIds <- sort(sample(1:(10*n), 10))
##D   
##D   newX <- testpts[newIds, drop = FALSE] 
##D   newZ <- sin(newX) + rnorm(length(newX), sd = noisefun(newX))
##D   points(newX, newZ, col = "blue", pch = 20)
##D   model <- update(object = model, newX, newZ)
##D   X <- c(X, newX)
##D   Z <- c(Z, newZ)
##D   plot(X, Z)
##D   print(model$nit_opt)
##D }
##D p_fin <- predict(x = testpts, object = model) 
##D lines(testpts, p_fin$mean, col = "blue")
##D lines(testpts, qnorm(0.05, p_fin$mean, sqrt(p_fin$sd2)), col = "blue", lty = 2)
##D lines(testpts, qnorm(0.95, p_fin$mean, sqrt(p_fin$sd2)), col = "blue", lty = 2)
##D lines(testpts, qnorm(0.05, p_fin$mean, sqrt(p_fin$sd2 + p_fin$nugs)),
##D       col = "blue", lty = 3)
##D lines(testpts, qnorm(0.95, p_fin$mean, sqrt(p_fin$sd2 + p_fin$nugs)),
##D       col = "blue", lty = 3)
##D 
##D model_direct <-  mleHomGP(X = X, Z = Z, lower = rep(0.1, nvar), upper = rep(50, nvar))
##D p_dir <- predict(x = testpts, object = model_direct)
##D print(model_direct$nit_opt)
##D lines(testpts, p_dir$mean, col = "green")
##D lines(testpts, qnorm(0.05, p_dir$mean, sqrt(p_dir$sd2)), col = "green", lty = 2)
##D lines(testpts, qnorm(0.95, p_dir$mean, sqrt(p_dir$sd2)), col = "green", lty = 2)
##D lines(testpts, qnorm(0.05, p_dir$mean, sqrt(p_dir$sd2 + p_dir$nugs)),
##D       col = "green", lty = 3)
##D lines(testpts, qnorm(0.95, p_dir$mean, sqrt(p_dir$sd2 + p_dir$nugs)),
##D       col = "green", lty = 3)
##D 
##D lines(testpts, sin(testpts), col = "red", lty = 2)
##D 
##D ## Compare outputs
##D summary(model_init)
##D summary(model)
##D summary(model_direct)
##D 
##D 
## End(Not run)




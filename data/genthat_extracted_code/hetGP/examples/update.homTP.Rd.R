library(hetGP)


### Name: update.homTP
### Title: Fast 'homTP'-update
### Aliases: update.homTP

### ** Examples

## Not run: 
##D ##------------------------------------------------------------
##D ## Example : Sequential Homoskedastic TP moding 
##D ##------------------------------------------------------------
##D set.seed(42)
##D 
##D ## Spatially varying noise function
##D noisefun <- function(x, coef = 1){
##D   return(coef * (0.05 + sqrt(abs(x)*20/(2*pi))/10))
##D }
##D 
##D df_noise <- 3
##D nvar <- 1
##D n <- 10
##D X <- matrix(seq(0, 2 * pi, length=n), ncol = 1)
##D mult <- sample(1:50, n, replace = TRUE)
##D X <- rep(X, mult)
##D Z <- sin(X) + noisefun(X) * rt(length(X), df = df_noise)
##D 
##D testpts <- matrix(seq(0, 2*pi, length = 10*n), ncol = 1)
##D mod <- mod_init <- mleHomTP(X = X, Z = Z, covtype = "Matern5_2",
##D                                 lower = rep(0.1, nvar), upper = rep(50, nvar))
##D preds <- predict(x = testpts, object = mod_init) 
##D plot(X, Z)
##D lines(testpts, preds$mean, col = "red")
##D 
##D 
##D nsteps <- 10
##D for(i in 1:nsteps){
##D   newIds <- sort(sample(1:(10*n), 5))
##D   
##D   newX <- testpts[rep(newIds, times = sample(1:50, length(newIds), replace = TRUE)), drop = FALSE] 
##D   newZ <- sin(newX) + noisefun(newX) * rt(length(newX), df = df_noise)
##D   points(newX, newZ, col = "blue", pch = 20)
##D   mod <- update(object = mod, newX, newZ)
##D   X <- c(X, newX)
##D   Z <- c(Z, newZ)
##D   plot(X, Z)
##D   print(mod$nit_opt)
##D }
##D p_fin <- predict(x = testpts, object = mod) 
##D lines(testpts, p_fin$mean, col = "blue")
##D lines(testpts, p_fin$mean + sqrt(p_fin$sd2) * qt(0.05, df = mod$nu + length(Z)),
##D       col = "blue", lty = 2)
##D lines(testpts, p_fin$mean + sqrt(p_fin$sd2) * qt(0.95, df = mod$nu + length(Z)),
##D       col = "blue", lty = 2)
##D lines(testpts, p_fin$mean + sqrt(p_fin$sd2 + p_fin$nugs) * qt(0.05, df = mod$nu + length(Z)),
##D       col = "blue", lty = 3)
##D lines(testpts, p_fin$mean + sqrt(p_fin$sd2 + p_fin$nugs) * qt(0.95, df = mod$nu + length(Z)),
##D       col = "blue", lty = 3)
##D 
##D mod_dir <-  mleHomTP(X = X, Z = Z, covtype = "Matern5_2",
##D                           lower = rep(0.1, nvar), upper = rep(50, nvar))
##D p_dir <- predict(x = testpts, object = mod_dir)
##D print(mod_dir$nit_opt)
##D lines(testpts, p_dir$mean, col = "green")
##D lines(testpts, p_dir$mean + sqrt(p_dir$sd2) * qt(0.05, df = mod_dir$nu + length(Z)),
##D       col = "green", lty = 2)
##D lines(testpts, p_dir$mean + sqrt(p_dir$sd2) * qt(0.95, df = mod_dir$nu + length(Z)),
##D       col = "green", lty = 2)
##D lines(testpts, p_dir$mean + sqrt(p_dir$sd2 + p_dir$nugs) * qt(0.05, df = mod_dir$nu + length(Z)),
##D       col = "green", lty = 3)
##D lines(testpts, p_dir$mean + sqrt(p_dir$sd2 + p_dir$nugs) * qt(0.95, df = mod_dir$nu + length(Z)),
##D       col = "green", lty = 3)
##D 
##D lines(testpts, sin(testpts), col = "red", lty = 2)
##D 
##D ## Compare outputs
##D summary(mod_init)
##D summary(mod)
##D summary(mod_dir)
##D 
##D 
## End(Not run)




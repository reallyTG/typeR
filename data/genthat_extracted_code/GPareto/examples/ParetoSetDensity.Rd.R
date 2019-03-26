library(GPareto)


### Name: ParetoSetDensity
### Title: Estimation of Pareto set density
### Aliases: ParetoSetDensity

### ** Examples

## Not run: 
##D  
##D #---------------------------------------------------------------------------
##D # Example of estimation of the density of Pareto optimal points
##D #---------------------------------------------------------------------------
##D set.seed(42)
##D n_var <- 2 
##D fname <- P1
##D lower <- rep(0, n_var)
##D upper <- rep(1, n_var)
##D 
##D res1 <- easyGParetoptim(fn = fname, lower = lower, upper = upper, budget = 15, 
##D control=list(method = "EHI", inneroptim = "pso", maxit = 20))
##D 
##D estDens <- ParetoSetDensity(res1$model, lower = lower, upper = upper)
##D 
##D # graphics
##D par(mfrow = c(1,2))
##D plot(estDens, display = "persp", xlab = "X1", ylab = "X2")
##D plot(estDens, display = "filled.contour2", main = "Estimated density of Pareto optimal point")
##D points(res1$model[[1]]@X[,1], res1$model[[2]]@X[,2], col="blue")
##D points(estDens$x[, 1], estDens$x[, 2], pch = 20, col = rgb(0, 0, 0, 0.15))
##D par(mfrow = c(1,1))
## End(Not run)




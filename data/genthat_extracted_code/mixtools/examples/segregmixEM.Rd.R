library(mixtools)


### Name: segregmixEM
### Title: ECM Algorithm for Mixtures of Regressions with Changepoints
### Aliases: segregmixEM regmixEM.chgpt
### Keywords: file

### ** Examples

## Not run: 
##D ## Simulated example.
##D 
##D set.seed(100)
##D x <- 1:20
##D y1 <- 3 + x + rnorm(20)
##D y2 <- 3 - x - 5*(x - 15)*(x > 15) + rnorm(20)
##D y <- c(y1, y2)
##D x <- c(x, x)
##D 
##D set.seed(100)
##D be <- list(c(3, -1, -5), c(3, 1))
##D s <- c(1, 1)
##D psi.locs <- list(comp.1 = list(x = 15), comp.2 = NULL)
##D out <- segregmixEM(y, cbind(1,x), verb = TRUE, k = 2,
##D                    beta = be, sigma = s, lambda = c(1, 1)/2, 
##D                    seg.Z = list(~x, NULL), psi = rbind(1, 0),
##D                    psi.locs = psi.locs, epsilon = 0.9)
##D 
##D z <- seq(0, 21, len = 40)
##D plot(x, y, col = apply(out$post, 1, which.max) + 1, pch = 19, 
##D 	   cex.lab = 1.4, cex = 1.4)
##D b <- out$beta
##D d <- out$psi.locs
##D lines(z, b[[1]][1] + b[[1]][2] * z + b[[1]][3] * 
##D       (z - d[[1]][[1]]) * (z > d[[1]][[1]]) , col = 2, lwd = 2)
##D lines(z, b[[2]][1] + b[[2]][2] * z, col = 3, lwd = 2)
##D abline(v = out$psi.locs[[1]][1], col = 2, lty = 2)
## End(Not run)

## Not run: 
##D ## Example using the NOdata.
##D  
##D data(NOdata)
##D attach(NOdata)
##D 
##D set.seed(100)
##D be <- list(c(1.30, -0.13, 0.08), c(0.56, 0.09))
##D s <- c(0.02, 0.04)
##D psi.locs <- list(comp.1 = list(NO = 1.57), comp.2 = NULL)
##D out <- segregmixEM(Equivalence, cbind(NO), verb = TRUE, k = 2,
##D                    beta = be, sigma = s, lambda = c(1, 1)/2, 
##D                    seg.Z = list(~NO, NULL), psi = rbind(1, 0),
##D                    psi.locs = psi.locs, epsilon = 0.1)
##D 
##D z <- seq(0, 5, len = 1000)
##D plot(NOdata, col = apply(out$post, 1, which.max) + 1, pch = 19, 
##D 	   cex.lab = 1.4, cex = 1.4, ylab = "Equivalence Ratio")
##D b <- out$beta
##D d <- out$psi.locs
##D lines(z, b[[1]][1] + b[[1]][2] * z + b[[1]][3] * 
##D       (z - d[[1]][[1]]) * (z > d[[1]][[1]]) , col = 2, lwd = 2)
##D lines(z, b[[2]][1] + b[[2]][2] * z, col = 3, lwd = 2)
##D abline(v = out$psi.locs[[1]][1], col = 2, lty = 2)
##D 
##D detach(NOdata)
## End(Not run)




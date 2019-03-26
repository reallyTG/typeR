library(PopED)


### Name: optim_ARS
### Title: Optimization Using Adaptive Random Search.
### Aliases: optim_ARS

### ** Examples


## "wild" function , global minimum at about -15.81515
fw <- function(x) 10*sin(0.3*x)*sin(1.3*x^2) + 0.00001*x^4 + 0.2*x+80

# optimization with fewer function evaluations compared to SANN
res1 <- optim_ARS(50, fw,lower = -50, upper=100)

# often not as good performance when upper and lower bounds are poor
res2 <- optim_ARS(50, fw, lower=-Inf,upper=Inf)

# Only integer values allowed
## Not run: 
##D  
##D res_int <- optim_ARS(50, fw, allowed_values = seq(-50,100,by=1))
## End(Not run)

## Not run: 
##D  
##D   #plot of the function and solutions
##D   require(graphics)
##D   plot(fw, -50, 50, n = 1000, main = "Minimizing 'wild function'")
##D   points(-15.81515, fw(-15.81515), pch = 16, col = "red", cex = 1)
##D   points(res1$par, res1$ofv, pch = 16, col = "green", cex = 1)
##D   points(res2$par, res2$ofv, pch = 16, col = "blue", cex = 1)
## End(Not run) 

# optim_ARS does not work great for hard to find minima on flat surface:
# Rosenbrock Banana function
# f(x, y) = (a-x)^2 + b(y-x^2)^2
# global minimum at (x, y)=(a, a^2), where f(x, y)=0. 
# Usually a = 1 and b = 100.
## Not run: 
##D  
##D   fr <- function(x,a=1,b=100) {   
##D     x1 <- x[1]
##D     x2 <- x[2]
##D     b*(x2 - x1*x1)^2 + (a - x1)^2
##D   }
##D   
##D   res3 <- optim_ARS(c(-1.2,1), fr,lower = -5, upper = 5)
##D   
##D   # plot the surface
##D   x <- seq(-50, 50, length= 30)
##D   y <- x
##D   f <- function(x,y){apply(cbind(x,y),1,fr)}
##D   z <- outer(x, y, f)
##D   persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue", ticktype="detailed") -> res
##D   points(trans3d(1, 1, 0, pmat = res), col = 2, pch = 16,cex=2)
##D   points(trans3d(res3$par[1], res3$par[1], res3$ofv, pmat = res), col = "green", pch = 16,cex=2)
## End(Not run)

# box constraints
flb <- function(x){
  p <- length(x) 
  sum(c(1, rep(4, p-1)) * (x - c(1, x[-p])^2)^2) 
}
## 25-dimensional box constrained
#optim(rep(3, 25), flb,lower = rep(2, 25), upper = rep(4, 25),method = "L-BFGS-B") 
res_box <- optim_ARS(rep(3, 25), flb,lower = rep(2, 25), upper = rep(4, 25)) 


## Combinatorial optimization: Traveling salesman problem
eurodistmat <- as.matrix(eurodist)

distance <- function(sq) {  # Target function
  sq2 <- embed(sq, 2)
  sum(eurodistmat[cbind(sq2[,2], sq2[,1])])
}

genseq <- function(sq) {  # Generate new candidate sequence
  idx <- seq(2, NROW(eurodistmat)-1)
  changepoints <- sample(idx, size = 2, replace = FALSE)
  tmp <- sq[changepoints[1]]
  sq[changepoints[1]] <- sq[changepoints[2]]
  sq[changepoints[2]] <- tmp
  sq
}

sq <- c(1:nrow(eurodistmat), 1)  # Initial sequence: alphabetic
res3 <- optim_ARS(sq,distance,generator=genseq) # Near optimum distance around 12842

## Not run: 
##D  
##D   # plot of initial sequence
##D   # rotate for conventional orientation
##D   loc <- -cmdscale(eurodist, add = TRUE)$points
##D   x <- loc[,1]; y <- loc[,2]
##D   s <- seq_len(nrow(eurodistmat))
##D   tspinit <- loc[sq,]
##D   
##D   plot(x, y, type = "n", asp = 1, xlab = "", ylab = "",
##D        main = paste("Initial sequence of traveling salesman problem\n",
##D                     "Distance =",distance(sq)), axes = FALSE)
##D   arrows(tspinit[s,1], tspinit[s,2], tspinit[s+1,1], tspinit[s+1,2],
##D          angle = 10, col = "green")
##D   text(x, y, labels(eurodist), cex = 0.8)
##D   
##D   # plot of final sequence from optim_ARS
##D   tspres <- loc[res3$par,]
##D   plot(x, y, type = "n", asp = 1, xlab = "", ylab = "",
##D        main = paste("optim_ARS() 'solving' traveling salesman problem\n",
##D                     "Distance =",distance(c(1,res3$par,1))),axes = FALSE)
##D   arrows(tspres[s,1], tspres[s,2], tspres[s+1,1], tspres[s+1,2],
##D          angle = 10, col = "red")
##D   text(x, y, labels(eurodist), cex = 0.8)
##D   
##D   # using optim
##D   set.seed(123) # chosen to get a good soln relatively quickly
##D   (res4 <- optim(sq, distance, genseq, method = "SANN",
##D                  control = list(maxit = 30000, temp = 2000, trace = TRUE,
##D                                 REPORT = 500))) 
##D   
##D   tspres <- loc[res4$par,]
##D   plot(x, y, type = "n", asp = 1, xlab = "", ylab = "",
##D        main = paste("optim() 'solving' traveling salesman problem\n",
##D                     "Distance =",distance(res4$par)),axes = FALSE)
##D   arrows(tspres[s,1], tspres[s,2], tspres[s+1,1], tspres[s+1,2],
##D          angle = 10, col = "red")
##D   text(x, y, labels(eurodist), cex = 0.8)
## End(Not run)  

# one-dimensional function
## Not run: 
##D  
##D   f <- function(x)  abs(x)+cos(x)
##D   res5 <- optim_ARS(-20,f,lower=-20, upper=20)
##D   
##D   curve(f, -20, 20)
##D   abline(v = res5$par, lty = 4,col="green")
## End(Not run)  

# one-dimensional function
f <- function(x)  (x^2+x)*cos(x) # -10 < x < 10
res_max <- optim_ARS(0,f,lower=-10, upper=10,maximize=TRUE) # sometimes to local maxima

## Not run: 
##D  
##D   res_min <- optim_ARS(0,f,lower=-10, upper=10) # sometimes to local minima
##D   
##D   curve(f, -10, 10)
##D   abline(v = res_min$par, lty = 4,col="green")
##D   abline(v = res_max$par, lty = 4,col="red")
## End(Not run)


# two-dimensional Rastrigin function
#It has a global minimum at f(x) = f(0) = 0.
## Not run: 
##D  
##D   Rastrigin <- function(x1, x2){
##D     20 + x1^2 + x2^2 - 10*(cos(2*pi*x1) + cos(2*pi*x2))
##D   }
##D   
##D   
##D   x1 <- x2 <- seq(-5.12, 5.12, by = 0.1)
##D   z <- outer(x1, x2, Rastrigin)
##D   
##D   res6 <- optim_ARS(c(-4,4),function(x) Rastrigin(x[1], x[2]),lower=-5.12, upper=5.12)
##D   
##D   # color scale
##D   nrz <- nrow(z)
##D   ncz <- ncol(z)
##D   jet.colors <-
##D     colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan",
##D                        "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000"))
##D   # Generate the desired number of colors from this palette
##D   nbcol <- 100
##D   color <- jet.colors(nbcol)
##D   # Compute the z-value at the facet centres
##D   zfacet <- z[-1, -1] + z[-1, -ncz] + z[-nrz, -1] + z[-nrz, -ncz]
##D   # Recode facet z-values into color indices
##D   facetcol <- cut(zfacet, nbcol)
##D   persp(x1, x2, z, col = color[facetcol], phi = 30, theta = 30)
##D   filled.contour(x1, x2, z, color.palette = jet.colors)
## End(Not run)


## Parallel computation  
## works better when each evaluation takes longer
## here we have added extra time to the computations
## just to show that it works
## Not run: 
##D  
##D   res7 <- optim_ARS(c(-4,4),function(x){Sys.sleep(0.01); Rastrigin(x[1], x[2])},
##D                     lower=-5.12, upper=5.12)
##D   res8 <- optim_ARS(c(-4,4),function(x){Sys.sleep(0.01); Rastrigin(x[1], x[2])},
##D                     lower=-5.12, upper=5.12,parallel = T)
##D   res9 <- optim_ARS(c(-4,4),function(x){Sys.sleep(0.01); Rastrigin(x[1], x[2])},
##D                     lower=-5.12, upper=5.12,parallel = T,parallel_type = "snow")
## End(Not run)




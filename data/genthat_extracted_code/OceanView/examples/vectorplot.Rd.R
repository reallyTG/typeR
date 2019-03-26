library(OceanView)


### Name: vector plots
### Title: Vector velocity plot.
### Aliases: vectorplot
### Keywords: hplot

### ** Examples

# save plotting parameters
 mf <- par("mfrow")

## =======================================================================
##  EXAMPLE 1: 
## =======================================================================

 par(mfrow = c(2, 2))

 u <- cos(seq(0, 2*pi, 0.1))
 v <- sin(seq(0, 2*pi, 0.1)+ 1)

 vectorplot(u = u, v = v)
 vectorplot(u = u, v = v, col = 1:10)

 x <- seq(0, 1, length.out = length(u))
 vectorplot(u = u, v = v, x = x, xfac = 3)
 points(x, rep(0, length(u)), pch = "+", col = "red")

 vectorplot(u = u, v = v, x = 1:length(u), xfac = 10)

## =======================================================================
##  EXAMPLE 2:  adding to a plot
## =======================================================================

 par(mfrow = c(2, 2))
 x <- 1:length(u)
 plot(x, u)
 vectorplot(u = u, v = v, x = x, xfac = 10, 
            add = TRUE, col = "red")
 
 vectorplot(u = u, v = v, x = x, xfac = 10, 
   colvar = sqrt(u^2+v^2), clab = "m/s")
 
 vectorplot(u = u, v = v, x = x, xfac = 10, 
   colvar = sqrt(u^2+v^2), clab = "m/s", log = "c")

# reset plotting parameters
 par(mfrow = mf)




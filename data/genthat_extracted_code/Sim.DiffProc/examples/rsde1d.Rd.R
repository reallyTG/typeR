library(Sim.DiffProc)


### Name: rsde1d
### Title: Approximate transitional densities and random generation for 1-D
###   SDE
### Aliases: rsde1d rsde1d.default dsde1d dsde1d.default print.dsde1d
###   plot.dsde1d
### Keywords: sde ts mts random generators transition density

### ** Examples


## Example 1:  
## dX(t) = (-2*(X(t)<=0)+2*(X(t)>=0)) *dt + 0.5 * dW(t)
set.seed(1234)

f <- expression(-2*(x<=0)+2*(x>=0))
g <- expression(0.5)
res1 <- snssde1d(drift=f,diffusion=g,M=5000)
x <- rsde1d(res1, at = 1)
summary(x)
dens1 <-  dsde1d(res1, at = 1)
dens1
plot(dens1,main="Transition density of X(t=1)|X(s=0)=0") # kernel estimated
plot(dens1,hist=TRUE) # histogramme

## Example 2:
## Transition density of standard Brownian motion W(t) at time = 0.5
set.seed(1234)

f <- expression(0)
g <- expression(1)
res2 <- snssde1d(drift=f,diffusion=g,M=5000)
plot(dsde1d(res2, at = 0.5),dens=function(x) dnorm(x,0,sqrt(0.5)))
plot(dsde1d(res2, at = 0.5),dens=function(x) dnorm(x,0,sqrt(0.5)),hist=TRUE)

## Example 3: Transition density of Brownian motion W(t) in [0,1]

## Not run: 
##D for (i in seq(res2$t0,res2$T,by=res2$Dt)){
##D plot(dsde1d(res2, at = i),main=paste0('Transition Density \n t = ',i))
##D }
## End(Not run)

## Example 4:
## Transition density of bridge Brownian motion W(t) at time = 0.25 and 0.75 
set.seed(1234)
## Not run: 
##D f <- expression(0)
##D g <- expression(1)
##D Bd <- bridgesde1d(drift=f,diffusion=g,M=5000)
##D Bd
##D plot(dsde1d(Bd, at = 0.25))         ## Transition Density at time=0.25
##D plot(dsde1d(Bd, at = 0.75),add=TRUE)## Transition Density at time=0.75
## End(Not run)




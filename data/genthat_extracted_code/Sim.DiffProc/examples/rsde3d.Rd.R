library(Sim.DiffProc)


### Name: rsde3d
### Title: Approximate transitional densities and random generation for 3-D
###   SDE's
### Aliases: rsde3d rsde3d.default dsde3d dsde3d.default print.dsde3d
###   plot.dsde3d
### Keywords: sde ts mts random generators transition density

### ** Examples


## Example 1: Ito sde
## dX(t) = (2*(Y(t)>0)-2*(Z(t)<=0)) dt + 0.2 * dW1(t) 
## dY(t) = -2*Y(t) dt + 0.2 * dW2(t) 
## dZ(t) = -2*Z(t) dt + 0.2 * dW3(t)        
## W1(t), W2(t) and W3(t) three independent Brownian motion
set.seed(1234)
fx <- expression(2*(y>0)-2*(z<=0) , -2*y, -2*z)
gx <- rep(expression(0.2),3)
mod3d1 <- snssde3d(x0=c(0,2,-2),drift=fx,diffusion=gx,M=1000,Dt=0.003)

# random at t= 0.75
r3d1 <- rsde3d(mod3d1,at=0.75)
summary(r3d1)

# Marginal transition density at t=0.75, t0=0

denM <- dsde3d(mod3d1,pdf="M",at=0.75)
denM
plot(denM)

# for Joint transition density at t=0.75;t0=0 
# Multiple isosurfaces
## Not run: 
##D denJ <- dsde3d(mod3d1,pdf="J", at= 0.75)
##D denJ
##D plot(denJ,display="rgl")
## End(Not run)

## Example 2: Stratonovich sde
## dX(t) = Y(t)* dt + X(t) o dW1(t)          
## dY(t) = (4*( 1-X(t)^2 )* Y(t) - X(t))* dt + 0.2 o dW2(t)
## dZ(t) = (4*( 1-X(t)^2 )* Z(t) - X(t))* dt + 0.2 o dW3(t)
set.seed(1234)

fx <- expression( y , (4*( 1-x^2 )* y - x), (4*( 1-x^2 )* z - x))
gx <- expression( x , 0.2, 0.2)
mod3d2 <- snssde3d(drift=fx,diffusion=gx,M=1000,type="str")

# random 
r3d2 <- rsde3d(mod3d2)
summary(r3d2)

# Marginal transition density at t=1, t0=0

denM <- dsde3d(mod3d2,pdf="M")
denM
plot(denM)

# for Joint transition density at t=1;t0=0
# Multiple isosurfaces
## Not run: 
##D denJ <- dsde3d(mod3d2,pdf="J")
##D denJ
##D plot(denJ,display="rgl")
## End(Not run)

## Example 3: Tivariate Transition Density of 3 Brownian motion (W1(t),W2(t),W3(t)) in [0,1]

## Not run: 
##D B3d <- snssde3d(drift=rep(expression(0),3),diffusion=rep(expression(1),3),M=500)
##D for (i in seq(B3d$Dt,B3d$T,by=B3d$Dt)){
##D plot(dsde3d(B3d, at = i,pdf="J"),box=F,main=paste0('Transition Density t = ',i))
##D }
## End(Not run)





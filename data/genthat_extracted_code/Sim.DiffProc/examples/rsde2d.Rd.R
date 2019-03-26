library(Sim.DiffProc)


### Name: rsde2d
### Title: Approximate transitional densities and random generation for 2-D
###   SDE's
### Aliases: rsde2d rsde2d.default dsde2d dsde2d.default print.dsde2d
###   plot.dsde2d
### Keywords: sde ts mts random generators transition density

### ** Examples

## Example:1
set.seed(1234)

# SDE's 2d
fx <- expression(3*(2-y),2*x)
gx <- expression(1,y)
mod2d <- snssde2d(drift=fx,diffusion=gx,x0=c(1,2),M=1000)

# random 
r2d <- rsde2d(mod2d,at=0.5)
summary(r2d)

# Marginal density 

denM <- dsde2d(mod2d,pdf="M", at=0.5)
denM
plot(denM)

# Joint density
denJ <- dsde2d(mod2d,pdf="J",n=200, at= 0.5,lims=c(-3,4,0,6))
denJ
plot(denJ)
plot(denJ,display="contour")

## Example 2: Bivariate Transition Density of 2 Brownian motion (W1(t),W2(t)) in [0,1]

## Not run: 
##D B2d <- snssde2d(drift=rep(expression(0),2),diffusion=rep(expression(1),2),
##D        M=10000)
##D for (i in seq(B2d$Dt,B2d$T,by=B2d$Dt)){
##D plot(dsde2d(B2d, at = i,lims=c(-3,3,-3,3),n=100),
##D    display="contour",main=paste0('Transition Density \n t = ',i))
##D }
## End(Not run)

## Example 3: 

## Not run: 
##D fx <- expression(4*(-1-x)*y , 4*(1-y)*x )
##D gx <- expression(0.25*y,0.2*x)
##D mod2d1 <- snssde2d(drift=fx,diffusion=gx,x0=c(x0=1,y0=-1),
##D       M=5000,type="str")
##D 
##D # Marginal transition density
##D for (i in seq(mod2d1$Dt,mod2d1$T,by=mod2d1$Dt)){
##D plot(dsde2d(mod2d1,pdf="M", at = i),main=
##D       paste0('Marginal Transition Density \n t = ',i))
##D }
##D 
##D # Bivariate transition density
##D for (i in seq(mod2d1$Dt,mod2d1$T,by=mod2d1$Dt)){
##D plot(dsde2d(mod2d1, at = i,lims=c(-1,2,-1,1),n=100),
##D     display="contour",main=paste0('Transition Density \n t = ',i))
##D }
## End(Not run)

## Example 4: Bivariate Transition Density of 2 bridge Brownian motion (W1(t),W2(t)) in [0,1]

## Not run: 
##D B2d <- bridgesde2d(drift=rep(expression(0),2),
##D   diffusion=rep(expression(1),2),M=5000)
##D for (i in seq(0.01,0.99,by=B2d$Dt)){ 
##D plot(dsde2d(B2d, at = i,lims=c(-3,3,-3,3),
##D  n=100),display="contour",main=
##D  paste0('Transition Density \n t = ',i))
##D }
## End(Not run)

## Example 5: Bivariate Transition Density of bridge 
## Ornstein-Uhlenbeck process and its integral in [0,5]
## dX(t) = 4*(-1-X(t)) dt + 0.2 dW1(t)
## dY(t) = X(t) dt + 0 dW2(t)
## x01 = 0 , y01 = 0
## x02 = 0, y02 = 0 
## Not run: 
##D fx <- expression(4*(-1-x) , x)
##D gx <- expression(0.2 , 0)
##D OUI <- bridgesde2d(drift=fx,diffusion=gx,Dt=0.005,M=1000)
##D for (i in seq(0.01,4.99,by=OUI$Dt)){
##D plot(dsde2d(OUI, at = i,lims=c(-1.2,0.2,-2.5,0.2),n=100),
##D  display="contour",main=paste0('Transition Density \n t = ',i))
##D }
## End(Not run)




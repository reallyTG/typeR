library(lorentz)


### Name: lorentz-package
### Title: The Lorentz Transform in Relativistic Physics
### Aliases: lorentz-package lorentz Lorentz gyrogroup
### Keywords: package

### ** Examples



## Create some random three-velocities:

u <- r3vel(10)
v <- r3vel(10)
w <- r3vel(10)

u+v
v+u  ## Velocity addition is not commutative

u+(v+w)   
(u+v)+w   ## nor associative





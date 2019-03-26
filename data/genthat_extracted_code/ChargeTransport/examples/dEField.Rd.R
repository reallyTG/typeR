library(ChargeTransport)


### Name: dEField
### Title: Site Energy Difference due to an Electric Field
### Aliases: dEField
### Keywords: manip

### ** Examples

dz <- rnorm(10,3.5,0.3)
Fnorm=1E5
# Electron transport along a 1D-stack of 10 molecules aligned along the z-axis
dEField(dx=0, dy=0, dz=dz, carrier="e", Fx=0, Fy=0, Fz=Fnorm)

# Hole transport along a 1D-stack of 10 molecules aligned along the z-axis
dEField(dx=0, dy=0, dz=dz, carrier="h", Fx=0, Fy=0, Fz=Fnorm)

# Some disorder in the xy-plan
dx <- rnorm(10,0,1)
dy <- rnorm(10,0,1)
dEField(dx=dx, dy=dy, dz=dz, carrier="e", Fx=0, Fy=0, Fz=Fnorm)

# Change the orientation of the electric field
theta = 45
dEField(dx=dx, dy=dy, dz=dz, carrier="h",
        Fx=0, Fy=Fnorm*sin(theta*pi/180), Fz=Fnorm*cos(theta*pi/180))




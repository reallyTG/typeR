library(lorentz)


### Name: r3vel
### Title: Random three-velocities
### Aliases: r3vel

### ** Examples


a <- r3vel(10000)
b <- r3vel(1000,0.8)
u <- as.3vel(c(0,0,0.9))

pairs(unclass(u+a),asp=1)
pairs(unclass(a+u),asp=1)

sol(299792458)
sound <- 343      # speed of sound in SI
r3vel(100,343)    # random 3-velocities with speed=343


sol(1)   # return to default c=1





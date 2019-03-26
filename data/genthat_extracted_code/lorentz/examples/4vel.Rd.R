library(lorentz)


### Name: 4vel
### Title: Four velocities
### Aliases: 4vel fourvel as.4vel is.consistent.4vel fourvelocity
###   four-velocity 4velocity 4-velocity as.4vel is.4vel to3 inner4 'inner
###   product'

### ** Examples


a <- r3vel(10)
as.4vel(a)     # a four-velocity

as.3vel(as.4vel(a))-a   # should be small

inner4(as.4vel(a))   # should be -1

stopifnot(all(is.consistent.4vel(as.4vel(a))))






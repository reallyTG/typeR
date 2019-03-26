library(lorentz)


### Name: sol
### Title: Speed of light and Minkowski metric
### Aliases: sol eta minkowski lightspeed celerity

### ** Examples


sol()                          # returns current speed of light
sol(299792458)                 # use SI units
sol()                          # speed of light now SI value

eta()                          # note [t,t] term
u <- as.3vel(c(100,200,300))   # fast terrestrial speed, but not relativistic
boost(u)                       # boost matrix practically Galilean
is.consistent.boost(boost(u))  # should be TRUE
sol(1)                         # revert to relativisitic units





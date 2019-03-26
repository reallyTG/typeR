library(lorentz)


### Name: Extract.3vel
### Title: Extract or replace parts of three-velocity
### Aliases: [.vel [<-.vel [.3vel [<-.3vel [.4vel [<-.4vel

### ** Examples


u <- r3vel(10)
u[1:4]
u[5:6] <- 0

u[7:8] <- u[1]

u[,1] <- 0.1





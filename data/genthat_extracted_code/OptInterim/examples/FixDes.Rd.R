library(OptInterim)


### Name: FixDes
### Title: Construct a Single-stage Design for a time-to-event Endpoint
###   Evaluated at a Pre-specifed Time Versus Either a Known Standard
###   Control or a Randomized Comparative Control
### Aliases: FixDes
### Keywords: design

### ** Examples

B.init <- c(1, 2, 3, 4, 5)
m.init <- c(15, 20, 25, 20, 15)
alpha <- 0.05
beta <- 0.1
param <- c(1, 1.09, 2, 1.40)
x <- 1

# H0: S0=0.40 H1: S1=0.60

FixDes(B.init, m.init, alpha, beta, param, x,num.arm=1)

m.init <- 5*c(15, 20, 25, 20, 15)
FixDes(B.init, m.init, alpha, beta, param, x,num.arm=2)





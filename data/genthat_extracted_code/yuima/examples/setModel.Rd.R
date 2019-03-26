library(yuima)


### Name: setModel
### Title: Basic description of stochastic differential equations (SDE)
### Aliases: setModel
### Keywords: ts

### ** Examples

# Ex 1. (One-dimensional diffusion process)
# To describe
# dXt = -3*Xt*dt + (1/(1+Xt^2+t))dWt,
# we set
mod1 <- setModel(drift = "-3*x", diffusion = "1/(1+x^2+t)", solve.variable = c("x"))
# We may omit the solve.variable; then the default variable x is used
mod1 <- setModel(drift = "-3*x", diffusion = "1/(1+x^2+t)")
# Look at the model structure by
str(mod1)

# Ex 2. (Two-dimensional diffusion process with three factors)
# To describe
# dX1t = -3*X1t*dt + dW1t +X2t*dW3t,
# dX2t = -(X1t + 2*X2t)*dt + X1t*dW1t + 3*dW2t,
# we set the drift coefficient
a <- c("-3*x1","-x1-2*x2")
# and also the diffusion coefficient
b <- matrix(c("1","x1","0","3","x2","0"),2,3)
# Then set
mod2 <- setModel(drift = a, diffusion = b, solve.variable = c("x1","x2"))
# Look at the model structure by
str(mod2)
# The noise.number is automatically determined by inputting the diffusion matrix expression.
# If the dimensions of the drift differs from the number of the rows of the diffusion, 
# the error message is returned.

# Ex 3. (Process with jumps (compound Poisson process))
# To describe
# dXt = -theta*Xt*dt+sigma*dZt
mod3 <- setModel(drift=c("-theta*x"), diffusion="sigma",
jump.coeff="1", measure=list(intensity="1", df=list("dnorm(z, 0, 1)")),
measure.type="CP", solve.variable="x")
# Look at the model structure by
str(mod3)

# Ex 4. (Process with jumps (stable process))
# To describe
# dXt = -theta*Xt*dt+sigma*dZt
mod4 <- setModel(drift=c("-theta*x"), diffusion="sigma",
jump.coeff="1", measure.type="code",measure=list(df="rstable(z,1,0,1,0)"), solve.variable="x")
# Look at the model structure by
str(mod4)
# See rng about other candidate of Levy noises.

# Ex 5. (Two-dimensional stochastic differenatial equation with Levy noise)
# To describe
# dX1t = (1 - X1t - X2t)*dt+dZ1t 
# dX2t = (0.5 - X1t - X2t)*dt+dZ2t
beta<-c(.5,.5)
mu<-c(0,0)
Lambda<-matrix(c(1,0,0,1),2,2)
mod5 <- setModel(drift=c("1 - x1-x2",".5 - x1-x2"), 
solve.variable=c("x1","x2"), jump.coeff=Lambda, measure.type="code",
measure=list(df="rNIG(z, alpha, beta, delta0, mu, Lambda)"))
# Look at the model structure by
str(mod5)

# Ex 6. (Process with fractional Gaussian noise)
# dYt = 3*Yt*dt + dWt^h
mod6 <- setModel(drift="3*y", diffusion=1, hurst=0.3, solve.variable=c("y"))
# Look at the model structure by
str(mod6)




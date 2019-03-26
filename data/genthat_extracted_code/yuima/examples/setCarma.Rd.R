library(yuima)


### Name: setCarma
### Title: Continuous Autoregressive Moving Average (p, q) model
### Aliases: Carma CARMA setCarma
### Keywords: ts

### ** Examples

# Ex 1. (Continuous ARMA process driven by a Brownian Motion)
# To describe the state-space representation of a CARMA(p=3,q=1) model:
# Vt=c0+alpha0*X0t+alpha1*X1t
# dX0t = X1t*dt 
# dX1t = X2t*dt
# dX2t = (-beta3*X0t-beta2*X1t-beta1*X2t)dt+dWt
# we set
mod1<-setCarma(p=3, 
               q=1, 
               loc.par="c0")
# Look at the model structure by
str(mod1)

# Ex 2. (General setCarma model driven by a Brownian Motion)
# To describe the model defined as:
# Vt=c0+alpha0*X0t+alpha1*X1t
# dX0t = X1t*dt 
# dX1t = X2t*dt
# dX2t = (-beta3*X0t-beta2*X1t-beta1*X2t)dt+(c0+alpha0*X0t)dWt
# we set 
mod2 <- setCarma(p=3,
                 q=1,
                 loc.par="c0",
                 ma.par="alpha",
                 ar.par="beta",
                 lin.par="alpha")
# Look at the model structure by
str(mod2)

# Ex 3. (Continuous Arma model driven by a Levy process)
# To specify the CARMA(p=3,q=1) model driven by a Compound Poisson process defined as:
# Vt=c0+alpha0*X0t+alpha1*X1t
# dX0t = X1t*dt 
# dX1t = X2t*dt
# dX2t = (-beta3*X0t-beta2*X1t-beta1*X2t)dt+dzt
# we set the Levy measure as in setModel
mod3 <- setCarma(p=3,
                 q=1,
                 loc.par="c0",
                 measure=list(intensity="1",df=list("dnorm(z, 0, 1)")),
                 measure.type="CP")
# Look at the model structure by
str(mod3)

# Ex 4. (General setCarma  model driven by a Levy process)
# Vt=c0+alpha0*X0t+alpha1*X1t
# dX0t = X1t*dt 
# dX1t = X2t*dt
# dX2t = (-beta3*X1t-beta2*X2t-beta1*X3t)dt+(c0+alpha0*X0t)dzt
mod4 <- setCarma(p=3,
                 q=1,
                 loc.par="c0",
                 ma.par="alpha",
                 ar.par="beta",
                 lin.par="alpha",
                 measure=list(intensity="1",df=list("dnorm(z, 0, 1)")),
                 measure.type="CP")
# Look at the model structure by
str(mod4)




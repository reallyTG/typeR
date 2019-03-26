library(rootSolve)


### Name: stodes
### Title: Steady-state solver for ordinary differential equations (ODE)
###   with a sparse jacobian.
### Aliases: stodes
### Keywords: math

### ** Examples


## =======================================================================
## 1000 simultaneous equations
## =======================================================================

model <- function (time, OC, parms, decay, ing)
{
 # model describing C in a sediment,
 # Upper boundary = imposed flux, lower boundary = zero-gradient
 Flux  <- v * c(OC[1] ,OC) +              # advection
          -Kz*diff(c(OC[1],OC,OC[N]))/dx  # diffusion;
 Flux[1]<- flux     # imposed flux

 # Rate of change= Flux gradient and first-order consumption
 dOC   <- -diff(Flux)/dx - decay*OC

 # Fraction of OC in first 5 layers is translocated to mean depth
 # (layer N/2)
 dOC[1:5]  <- dOC[1:5] - ing*OC[1:5]
 dOC[N/2]  <- dOC[N/2] + ing*sum(OC[1:5])
 list(dOC)
}

v    <- 0.1    # cm/yr
flux <- 10
dx   <- 0.01
N    <- 1000
dist <- seq(dx/2, by = dx, len = N)
Kz   <- 1  #bioturbation (diffusion), cm2/yr
ss   <- stodes(runif(N), func = model, parms = NULL,
               positive = TRUE, decay = 5, ing = 20, verbose = TRUE)

plot(ss$y[1:N], dist, ylim = rev(range(dist)), type = "l", lwd = 2,
     xlab = "Nonlocal exchange", ylab = "sediment depth",
     main = "stodes, sparse jacobian")

# the size of lrw is in the attributes()$dims vector.     
attributes(ss)     




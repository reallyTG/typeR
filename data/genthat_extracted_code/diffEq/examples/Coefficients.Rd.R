library(diffEq)


### Name: Coefficients
### Title: The coefficients of multistep methods
### Aliases: Coefficients BDF AdamsMoulton AdamsBashforth
### Keywords: datasets

### ** Examples

## =============================================================================
## Stability properties
## =============================================================================

BDF

stability.multistep(alpha = BDF$alpha[3,], beta = BDF$beta[3,], 
  xlim = c(-7,7), ylim = c(-7,7))

stability.multistep(alpha = AdamsMoulton$alpha[3,], beta = AdamsMoulton$beta[3,], 
  xlim = c(-7,7), ylim = c(-7,7) )

stability.multistep(alpha = AdamsBashforth$alpha[3,], beta = AdamsBashforth$beta[3,] )

## =============================================================================
## Running a BDF
## =============================================================================
# test model
ode1  <- function (t, y)  return(cos(t)*y )

h     <- 0.01
times <- seq(from = 0, to = 20, by = h)
yout  <- vector (length = length(times))
yout[1] <- 1

# 3rd order BDF
Alpha <- BDF$alpha [3,2:4]
Beta  <- BDF$beta[3,]

bdf <- function(y, t, h, f, ys) {   

  rootfun <- function(ynext) 
    - ynext - sum(Alpha * ys) + Beta * h * f(t + h, ynext)

  y <- multiroot(f=rootfun, start=y)$root

  ys[2:3] <- ys[1:2]
  ys[1]   <- y 

  list (y = y, ys=ys)                                               
}

# Spinup uses Euler...
Euler <- function(y, t, h, f) {
  fn    <- f(t, y) 
  ynext <- y + h * fn

  list (y = ynext, fn = fn)
}

for (i in 2:3)
  yout[i] <- Euler(yout[i-1], times[i-1], h, ode1)$y

ys <- rev(yout[1:3])

# BDF steps
for (i in 4:length(times)){
  step    <- bdf (y=yout[i-1], t=times[i-1], h=h, f=ode1, ys=ys) 
  yout[i] <- step$y
  ys      <- step$ys
} 





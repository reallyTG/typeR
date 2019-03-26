library(rootSolve)


### Name: plot.steady1D
### Title: Plot and Summary Method for steady1D, steady2D and steady3D
###   Objects
### Aliases: plot.steady1D image.steady2D subset.steady2D image.steady3D
###   summary.rootSolve
### Keywords: hplot

### ** Examples

## =======================================================================
##  EXAMPLE 1: 1D model, BOD + O2                                
## =======================================================================
## Biochemical Oxygen Demand (BOD) and oxygen (O2) dynamics
## in a river

#==================#
# Model equations  #
#==================#
O2BOD <- function(t, state, pars) {
  BOD <- state[1:N]
  O2  <- state[(N+1):(2*N)]

# BOD dynamics
  FluxBOD <-  v * c(BOD_0, BOD)  # fluxes due to water transport
  FluxO2  <-  v * c(O2_0, O2)
  
  BODrate <- r*BOD*O2/(O2+10)  # 1-st order consumption, Monod in oxygen

#rate of change = flux gradient - consumption  + reaeration (O2)
  dBOD         <- -diff(FluxBOD)/dx  - BODrate
  dO2          <- -diff(FluxO2)/dx   - BODrate + p*(O2sat-O2)

  return(list(c(dBOD = dBOD, dO2 = dO2)))
}    # END O2BOD
 
 
#==================#
# Model application#
#==================#
# parameters
dx      <- 100       # grid size, meters
v       <- 1e2       # velocity, m/day
x       <- seq(dx/2,10000,by=dx)  # m, distance from river
N       <- length(x)
r       <- 0.1       # /day, first-order decay of BOD
p       <- 0.1       # /day, air-sea exchange rate
O2sat   <- 300       # mmol/m3 saturated oxygen conc
O2_0    <- 50        # mmol/m3 riverine oxygen conc
BOD_0   <- 1500      # mmol/m3 riverine BOD concentration

# initial guess:
state <- c(rep(200,N), rep(200,N))

# running the model
out   <- steady.1D (y = state, func = O2BOD, parms = NULL,
                    nspec = 2, pos = TRUE, 
                    names = c("BOD", "O2"))

summary(out)

# output
plot(out, grid = x, type = "l", lwd = 2, 
     ylab = c("mmol/m3", "mmol O2/m3"))

# observations
obs <- matrix (ncol = 2, data = c(seq(0, 10000, 2000),
                                c(1400, 900,400,100,10,10)))

colnames(obs) <- c("Distance", "BOD")

# plot with observations
plot(out, grid = x, type = "l", lwd = 2, ylab = "mmol/m3", obs = obs, 
     pch = 16, cex = 1.5)

# similar but data in "long" format
OUT <- data.frame(name = "BOD", obs)
## Not run: 
##D plot(out, grid = x, type = "l", lwd = 2, ylab = "mmol/m3", obs = OBS, 
##D      pch = 16, cex = 1.5)
## End(Not run)

## =======================================================================
##  EXAMPLE 2: 1D model, BOD + O2 - second run                               
## =======================================================================
# new runs with different v
v       <- 50       # velocity, m/day

# running the model a second time
out2   <- steady.1D (y = state, func = O2BOD, parms = NULL,
                     nspec = 2, pos = TRUE, names = c("BOD", "O2"))


v       <- 200       # velocity, m/day

# running the model a second time
out3   <- steady.1D (y = state, func = O2BOD, parms = NULL,
                     nspec = 2, pos = TRUE, names = c("BOD", "O2"))

# output of all three scenarios at once
plot(out, out2, out3, type = "l", lwd = 2, 
     ylab = c("mmol/m3", "mmol O2/m3"), grid = x,
     obs = obs, which = c("BOD", "O2"))
  
# output of all three scenarios at once, and using vertical style
plot(out, out2, out3, type = "l", lwd = 2, vertical = TRUE,
     ylab = "Distance [m]",
     main = c("BOD [mmol/m3]", "O2 [mmol O2/m3]"), grid = x,
     obs = obs, which = c("BOD", "O2"))

# change plot pars
plot(out, out2, out3, type = "l", lwd = 2, 
     ylab = c("mmol/m3", "mmol O2/m3"), 
     grid = x, col = c("blue", "green"), log = "y",  
     obs = obs, obspar = list(pch = 16, col = "red", cex = 2))

## =======================================================================
## EXAMPLE 3: Diffusion in 2-D; zero-gradient boundary conditions
## =======================================================================

diffusion2D <- function(t,Y,par)  {
   y    <- matrix(nr=n,nc=n,data=Y)  # vector to 2-D matrix
   dY   <- -r*y        # consumption
   BND   <- rep(1,n)   # boundary concentration 

   #diffusion in X-direction; boundaries=imposed concentration
   Flux <- -Dx * rbind(y[1,]-BND, (y[2:n,]-y[1:(n-1),]), BND-y[n,])/dx
   dY   <- dY - (Flux[2:(n+1),]-Flux[1:n,])/dx

   #diffusion in Y-direction
   Flux <- -Dy * cbind(y[,1]-BND, (y[,2:n]-y[,1:(n-1)]), BND-y[,n])/dy
   dY    <- dY - (Flux[ ,2:(n+1)]-Flux[ ,1:n])/dy
                                              
   return(list(as.vector(dY)))
}

  # parameters
dy    <- dx <- 1   # grid size
Dy    <- Dx <- 1   # diffusion coeff, X- and Y-direction
r     <- 0.025     # consumption rate

n  <- 100
Y  <- matrix(nrow = n, ncol = n, 10.)

ST <- steady.2D(Y, func = diffusion2D, parms = NULL, pos = TRUE,
                dimens = c(n, n), lrw = 1000000,
                atol = 1e-10, rtol = 1e-10, ctol = 1e-10)
grid <- list(x = seq(dx/2, by = dx, length.out = n), 
             y = seq(dy/2, by = dy, length.out = n))
image(ST, grid = grid)
summary(ST)




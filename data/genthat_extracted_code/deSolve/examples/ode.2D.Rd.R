library(deSolve)


### Name: ode.2D
### Title: Solver for 2-Dimensional Ordinary Differential Equations
### Aliases: ode.2D
### Keywords: math

### ** Examples

## =======================================================================
## A Lotka-Volterra predator-prey model with predator and prey
## dispersing in 2 dimensions
## =======================================================================

## ==================
## Model definitions
## ==================

lvmod2D <- function (time, state, pars, N, Da, dx) {
  NN <- N*N
  Prey <- matrix(nrow = N, ncol = N,state[1:NN])
  Pred <- matrix(nrow = N, ncol = N,state[(NN+1):(2*NN)])

  with (as.list(pars), {
    ## Biology
    dPrey <- rGrow * Prey * (1- Prey/K) - rIng  * Prey * Pred
    dPred <- rIng  * Prey * Pred*assEff - rMort * Pred

    zero <- rep(0, N)

    ## 1. Fluxes in x-direction; zero fluxes near boundaries
    FluxPrey <- -Da * rbind(zero,(Prey[2:N,] - Prey[1:(N-1),]), zero)/dx
    FluxPred <- -Da * rbind(zero,(Pred[2:N,] - Pred[1:(N-1),]), zero)/dx

    ## Add flux gradient to rate of change
    dPrey    <- dPrey - (FluxPrey[2:(N+1),] - FluxPrey[1:N,])/dx
    dPred    <- dPred - (FluxPred[2:(N+1),] - FluxPred[1:N,])/dx

    ## 2. Fluxes in y-direction; zero fluxes near boundaries
    FluxPrey <- -Da * cbind(zero,(Prey[,2:N] - Prey[,1:(N-1)]), zero)/dx
    FluxPred <- -Da * cbind(zero,(Pred[,2:N] - Pred[,1:(N-1)]), zero)/dx

    ## Add flux gradient to rate of change
    dPrey    <- dPrey - (FluxPrey[,2:(N+1)] - FluxPrey[,1:N])/dx
    dPred    <- dPred - (FluxPred[,2:(N+1)] - FluxPred[,1:N])/dx

    return(list(c(as.vector(dPrey), as.vector(dPred))))
 })
}


## ===================
## Model applications
## ===================

pars    <- c(rIng   = 0.2,    # /day, rate of ingestion
             rGrow  = 1.0,    # /day, growth rate of prey
             rMort  = 0.2 ,   # /day, mortality rate of predator
             assEff = 0.5,    # -, assimilation efficiency
             K      = 5  )    # mmol/m3, carrying capacity

R  <- 20                      # total length of surface, m
N  <- 50                      # number of boxes in one direction
dx <- R/N                     # thickness of each layer
Da <- 0.05                    # m2/d, dispersion coefficient

NN <- N*N                     # total number of boxes

## initial conditions
yini    <- rep(0, 2*N*N)
cc      <- c((NN/2):(NN/2+1)+N/2, (NN/2):(NN/2+1)-N/2)
yini[cc] <- yini[NN+cc] <- 1

## solve model (5000 state variables...  use Cash-Karp Runge-Kutta method
times   <- seq(0, 50, by = 1)
out <- ode.2D(y = yini, times = times, func = lvmod2D, parms = pars,
              dimens = c(N, N), names = c("Prey", "Pred"),
              N = N, dx = dx, Da = Da, method = rkMethod("rk45ck"))

diagnostics(out)
summary(out)

# Mean of prey concentration at each time step
Prey <- subset(out, select = "Prey", arr = TRUE)
dim(Prey)
MeanPrey <- apply(Prey, MARGIN = 3, FUN = mean)
plot(times, MeanPrey)

## Not run: 
##D ## plot results
##D Col <- colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan",
##D                           "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000"))
##D 
##D for (i in seq(1, length(times), by = 1))
##D    image(Prey[ , ,i],
##D    col = Col(100), xlab = , zlim = range(out[,2:(NN+1)]))
##D 
##D ## similar, plotting both and adding a margin text with times:
##D image(out, xlab = "x", ylab = "y", mtext = paste("time = ", times))
## End(Not run)

select <- c(1, 40)
image(out, xlab = "x", ylab = "y", mtext = "Lotka-Volterra in 2-D",
      subset = select, mfrow = c(2,2), legend =  TRUE)


# plot prey and pred at t = 10; first use subset to select data
prey10 <-  matrix (nrow = N, ncol = N, 
     data = subset(out, select = "Prey", subset = (time == 10)))
pred10 <-  matrix (nrow = N, ncol = N, 
     data = subset(out, select = "Pred", subset = (time == 10)))

mf <- par(mfrow = c(1, 2))
image(prey10)
image(pred10)
par (mfrow = mf)

# same, using deSolve's image:
image(out, subset = (time == 10))

## =======================================================================
## An example with a cyclic boundary condition.
## Diffusion in 2-D; extra flux on 2 boundaries,
## cyclic boundary in y
## =======================================================================


diffusion2D <- function(t, Y, par) {
  y    <- matrix(nrow = nx, ncol = ny, data = Y)  # vector to 2-D matrix
  dY   <- -r * y       # consumption
  BNDx <- rep(1, nx)   # boundary concentration
  BNDy <- rep(1, ny)   # boundary concentration

  ## diffusion in X-direction; boundaries=imposed concentration
  Flux <- -Dx * rbind(y[1,] - BNDy, (y[2:nx,] - y[1:(nx-1),]), BNDy - y[nx,])/dx
  dY   <- dY - (Flux[2:(nx+1),] - Flux[1:nx,])/dx

  ## diffusion in Y-direction
  Flux <- -Dy * cbind(y[,1] - BNDx, (y[,2:ny]-y[,1:(ny-1)]), BNDx - y[,ny])/dy
  dY   <- dY - (Flux[,2:(ny+1)] - Flux[,1:ny])/dy

  ## extra flux on two sides
  dY[,1] <- dY[,1] + 10
  dY[1,] <- dY[1,] + 10

  ## and exchange between sides on y-direction
  dY[,ny] <- dY[,ny] + (y[,1] - y[,ny]) * 10
  return(list(as.vector(dY)))
}

## parameters
dy <- dx <- 1  # grid size
Dy <- Dx <- 1  # diffusion coeff, X- and Y-direction
r  <- 0.05     # consumption rate

nx <- 50
ny <- 100
y  <- matrix(nrow = nx, ncol = ny, 1)

## model most efficiently solved with lsodes - need to specify lrw

print(system.time(
  ST3 <- ode.2D(y, times = 1:100, func = diffusion2D, parms = NULL,
                dimens = c(nx, ny), verbose = TRUE, names = "Y",
                lrw = 400000, atol = 1e-10, rtol = 1e-10, cyclicBnd = 2)
))

# summary of 2-D variable
summary(ST3)

# plot output at t = 10
t10 <-  matrix (nrow = nx, ncol = ny, 
     data = subset(ST3, select = "Y", subset = (time == 10)))

persp(t10, theta = 30, border = NA, phi = 70, 
     col = "lightblue", shade = 0.5, box = FALSE)

# image plot, using deSolve's image function
image(ST3, subset = time == 10, method = "persp",
      theta = 30, border = NA, phi = 70, main = "", 
      col = "lightblue", shade = 0.5, box = FALSE)

## Not run: 
##D zlim <- range(ST3[, -1])
##D for (i in 2:nrow(ST3)) {
##D   y <- matrix(nrow = nx, ncol = ny, data = ST3[i, -1])
##D   filled.contour(y, zlim = zlim, main = i)
##D }
##D 
##D # same
##D image(ST3, method = "filled.contour")
## End(Not run)





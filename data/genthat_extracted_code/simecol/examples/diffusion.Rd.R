library(simecol)


### Name: diffusion
### Title: A Random Walk Particle Diffusion Model
### Aliases: diffusion
### Keywords: datasets

### ** Examples

##============================================
## Basic Usage:
##   explore the example
##============================================
## Not run: 
##D data(diffusion)
##D ## (1) minimal example
##D plot(sim(diffusion))
##D ## show "grid of environmental conditions"
##D image(inputs(diffusion))
##D 
##D ## (2) scenario
##D ##     with homogeneous environment (no "refuge" in the middle)
##D no_refuge <- diffusion # Cloning of the whole model object
##D inputs(no_refuge) <- matrix(1, 100, 100)
##D plot(sim(no_refuge))
##D   
##D ##============================================
##D ## Advanced Usage:
##D ##   Assign a function to the observer-slot.
##D ##============================================
##D observer(diffusion) <- function(state, ...) {
##D   ## numerical output to the screen
##D   cat("mean x=", mean(state$x),
##D       ", mean y=", mean(state$y),
##D       ", sd   x=", sd(state$x),
##D       ", sd   y=", sd(state$y), "\n")
##D   ## animation
##D   par(mfrow=c(2,2))
##D   plot(state$x, state$y, xlab="x", ylab="y", pch=16, col="red", xlim=c(0, 100))
##D   hist(state$y)
##D   hist(state$x)
##D   ## default case: return the state --> iteration stores it in "out"
##D   state
##D }
##D 
##D sim(diffusion)
##D 
##D ## remove the observer and restore original behavior
##D observer(diffusion) <- NULL
##D diffusion <- sim(diffusion)
## End(Not run)

##============================================
## Implementation:
##   The code of the diffusion model.
##   Note the use of the "initfunc"-slot.
##============================================
diffusion <- rwalkModel(
  main = function(time, init, parms, inputs = NULL) {
    speed   <- parms$speed
    xleft   <- parms$area[1]
    xright  <- parms$area[2]
    ybottom <- parms$area[3]
    ytop    <- parms$area[4]

    x <- init$x  # x coordinate
    y <- init$y  # y coordinate
    a <- init$a  # angle (in radians)
    n <- length(a)

    ## Rule 1: respect environment (grid as given in "inputs")
    ## 1a) identify location on "environmental 2D grid" for each individual
    i.j <- array(c(pmax(1, ceiling(x)), pmax(1, ceiling(y))), dim=c(n, 2))

    ## 1b) speed dependend on "environmental conditions"
    speed <- speed * inputs[i.j]

    ## Rule 2: Random Walk
    a  <- (a + 2 * pi / runif(a)) 
    dx <- speed * cos(a)
    dy <- speed * sin(a)
    x  <- x + dx
    y  <- y + dy

    ## Rule 3: Wrap Around
    x <- ifelse(x > xright, xleft, x)
    y <- ifelse(y > ytop, ybottom, y)
    x <- ifelse(x < xleft, xright, x)
    y <- ifelse(y < ybottom, ytop, y)
    data.frame(x=x, y=y, a=a)
  },
  times  = c(from=0, to=100, by=1),
  parms  = list(ninds=50, speed = 1, area = c(0, 100, 0, 100)),
  solver = "iteration",
  initfunc = function(obj) {
    ninds   <- obj@parms$ninds
    xleft   <- obj@parms$area[1]
    xright  <- obj@parms$area[2]
    ybottom <- obj@parms$area[3]
    ytop    <- obj@parms$area[4]
    obj@init <- data.frame(x = runif(ninds) * (xright - xleft) + xleft,
                           y = runif(ninds) * (ytop - ybottom) + ybottom,
                           a = runif(ninds) * 2 * pi)
    inp <- matrix(1, nrow=100, ncol=100)
    inp[, 45:55] <- 0.2
    inputs(obj) <- inp
    obj
  }
)




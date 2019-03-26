library(simecol)


### Name: observer
### Title: Get or Set an Observer Functions to an 'simObj' Object
### Aliases: observer observer-methods observer,simObj-method observer<-
###   observer<--methods observer<-,simObj-method
### Keywords: programming

### ** Examples


## load model "diffusion"
data(diffusion)

solver(diffusion) # solver is iteration, supports observer
times(diffusion) <- c(from=0, to=20, by=1) # to can be increased, to e.g. 100

### == Example 1 ===============================================================

## assign an observer for visualisation
observer(diffusion) <- function(state) {
  ## numerical output to the screen
  cat("mean x=", mean(state$x),
      ", mean y=", mean(state$y),
      ", sd   x=", sd(state$x),
      ", sd   y=", sd(state$y), "\n")
  ## animation
  par(mfrow = c(2, 2))
  plot(state$x, state$y, xlab = "x", ylab = "y", pch = 16, 
    col = "red", xlim = c(0, 100))
  hist(state$y)
  hist(state$x)
  
  ## default case: 
  ## return the state --> iteration stores full state in "out"
  state
}

sim(diffusion)

### == Example 2 ===============================================================

## an extended observer with full argument list
observer(diffusion) <- function(state, time, i, out, y) {
  ## numerical output to the screen
  cat("index =", i,
      ", time =", time,
      ", sd   x=", sd(state$x),
      ", sd   y=", sd(state$y), "\n")
  ## animation
  par(mfrow = c(2, 2))
  plot(state$x, state$y, xlab = "x", ylab = "y", pch = 16, 
    col = "red", xlim = c(0, 100))
  hist(state$y)
  hist(state$x)
  if (is.matrix(out)) # important because out may be NULL for the first call
    matplot(out[,1], out[,-1]) # dynamic graph of sd in both directions
  
  ## return a vector with summary information
  c(times = time, sdx=sd(state$x), sdy=sd(state$y))
}

diffusion <- sim(diffusion)

### == Restore default =========================================================

observer(diffusion) <- NULL # delete observer
diffusion <- sim(diffusion)





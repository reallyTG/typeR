library(PBSddesolve)


### Name: dde
### Title: Solve Delay Differential Equations
### Aliases: dde
### Keywords: math

### ** Examples

##################################################
# This is just a single example of using dde.
# For more examples see demo(package="PBSddesolve")
# the demos require the package PBSmodelling
##################################################

require(PBSddesolve)
local(env=.PBSddeEnv, expr={
  #create a func to return dde gradient
  yprime <- function(t,y,parms) {
    if (t < parms$tau)
      lag <- parms$initial
    else
      lag <- pastvalue(t - parms$tau)
    y1 <- parms$a * y[1] - (y[1]^3/3) + parms$m * (lag[1] - y[1])
    y2 <- y[1] - y[2]
    return(c(y1,y2))
  }

  #define initial values and parameters
  yinit <- c(1,1)
  parms <- list(tau=3, a=2, m=-10, initial=yinit)

  # solve the dde system
  yout <- dde(y=yinit,times=seq(0,30,0.1),func=yprime,parms=parms)

  # and display the results
  plot(yout$time, yout$y1, type="l", col="red", xlab="t", ylab="y", 
    ylim=c(min(yout$y1, yout$y2), max(yout$y1, yout$y2)))
  lines(yout$time, yout$y2, col="blue")
  legend("topleft", legend = c("y1", "y2"),lwd=2, lty = 1, 
    xjust = 1, yjust = 1, col = c("red","blue"))
})




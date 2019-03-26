library(deTestSet)


### Name: dopri853
### Title: Dormand-Prince Runge-Kutta of Order 8(5,3)
### Aliases: dopri853
### Keywords: math

### ** Examples


## =======================================================================
## Example :
##   The Arenstorff orbit model
## =======================================================================

Arenstorff <- function(t, y, parms) {

  D1 <- ((y[1]+mu)^2+y[2]^2)^(3/2)
  D2 <- ((y[1]-(1-mu))^2+y[2]^2)^(3/2)

  dy1 <- y[3]
  dy2 <- y[4]
  dy3 <- y[1] + 2*y[4]-(1-mu)*(y[1]+mu)/D1 -mu*(y[1]-(1-mu))/D2
  dy4 <- y[2] - 2*y[3]-(1-mu)*y[2]/D1 - mu*y[2]/D2

  list(c(dy1, dy2, dy3, dy4))
}

#-----------------------------
# parameters, initial values and times
#-----------------------------
mu    <- 0.012277471

yini  <- c(x = 0.994, y = 0, dx = 0, dy = -2.00158510637908252240537862224)

times <- seq(0, 18, 0.01)

#-----------------------------
# solve the model
#-----------------------------

out <- dopri853 (times = times, y = yini, func = Arenstorff, parms = NULL, 
  rtol = 1e-17, atol = 1e-17)

plot(out[,c("x", "y")], type = "l", lwd = 2, main = "Arenstorff")

#-----------------------------
# First and last value should be the same
#-----------------------------

times <- c(0, 17.0652165601579625588917206249)

Test  <- dopri853 (times = times, y = yini, func = Arenstorff, parms = NULL)

diagnostics(Test)





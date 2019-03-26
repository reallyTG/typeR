library(deTestSet)


### Name: dae
### Title: General Solver for Differential Algebraic Equations
### Aliases: dae
### Keywords: math

### ** Examples


## =======================================================================
## Chemical problem
## =======================================================================

daefun <- function(t, y, dy, parms) {
  with (as.list(c(y, dy, parms)), {
    res1 <- dA + dAB + lambda * A
    res2 <- dAB + dB
    alg <- B * A - K * AB
  list(c(res1, res2, alg), sumA = A + AB)
  })
}

parms <- c(lambda = 0.1, K = 1e-4)

yini  <- with(as.list(parms),
     c(A = 1, AB = 1, B = K))
dyini <- c(dA = 0, dAB = 0, dB = 0)

times <- 0:100

print(system.time(
out <-dae (y=yini, dy = dyini, times = times, res = daefun,
           parms = parms, method = "daspk")
))

plot(out, ylab = "conc.", xlab = "time", lwd = 2)
mtext("IVP DAE", side = 3, outer = TRUE, line = -1)





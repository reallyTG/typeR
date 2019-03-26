library(bvpSolve)


### Name: plot.bvpSolve
### Title: Plot and Print Methods for Output of bvp solvers
### Aliases: plot.bvpSolve print.bvpSolve
### Keywords: hplot

### ** Examples

## =============================================================================
## The example MUSN from Ascher et al., 1995.
## Numerical Solution of Boundary Value Problems for Ordinary Differential
## Equations, SIAM, Philadelphia, PA, 1995.
##
## The problem is
##      u' =  0.5*u*(w - u)/v
##      v' = -0.5*(w - u)
##      w' = (0.9 - 1000*(w - y) - 0.5*w*(w - u))/z
##      z' =  0.5*(w - u)
##      y' = -100*(y - w)
##   on the interval [0 1] and with boundary conditions:
##      u(0) = v(0) = w(0) = 1,  z(0) = -10,  w(1) = y(1)
## =============================================================================

musn <- function(t, Y, pars)  {
  with (as.list(Y),
  {
   du <- 0.5 * u * (w-u)/v
   dv <- -0.5 * (w-u)
   dw <- (0.9 - 1000 * (w-y) - 0.5 * w * (w-u))/z
   dz <- 0.5 * (w-u)
   dy <- -100 * (y-w)
   return(list(c(du, dv, dw, dz, dy)))
  })
}

#--------------------------------
# Boundaries
#--------------------------------
bound <- function(i,y,pars) {
  with (as.list(y), {
    if (i ==1) return (u-1)
    if (i ==2) return (v-1)
    if (i ==3) return (w-1)
    if (i ==4) return (z+10)
    if (i ==5) return (w-y)
 })
}

xguess <- seq(0, 1, len = 5)
yguess <- matrix(ncol = 5, (rep(c(1, 1, 1, -10, 0.91), times = 5)) )
rownames(yguess) <- c("u", "v", "w", "z", "y")

sol  <- bvpcol (bound = bound, x = seq(0, 1, by = 0.05), 
          leftbc = 4, func = musn, xguess = xguess, yguess = yguess)

mf <- par("mfrow")
plot(sol)
par(mfrow = mf)

## =============================================================================
## Example 2. Example Problem 31 from Jeff Cash's website
## =============================================================================

Prob31 <- function(t, Y, pars)  {
  with (as.list(Y), {
    dy    <- sin(Tet)
    dTet  <- M
    dM    <- -Q/xi
    T     <- 1/cos (Tet) +xi*Q*tan(Tet)
    dQ    <- 1/xi*((y-1)*cos(Tet)-M*T)
    list(c( dy, dTet, dM, dQ))
  })
}

ini <- c(y = 0, Tet = NA, M = 0, Q = NA)
end <- c(y = 0, Tet = NA, M = 0, Q = NA)

# run 1
xi <-0.1
twp  <- bvptwp(yini = ini, yend = end, x = seq(0, 1, by = 0.01),
               func = Prob31, atol = 1e-10)

# run 2
xi <- 0.05
twp2 <- bvptwp(yini = ini, yend = end, x = seq(0, 1, by = 0.01),
               func = Prob31, atol = 1e-10)

# run 3
xi <- 0.01
twp3 <- bvptwp(yini = ini, yend = end, x = seq(0, 1, by = 0.01),
               func = Prob31, atol = 1e-10)

# print all outputs at once
plot(twp, twp2, twp3, xlab = "x", ylab = names(ini))


# change type, colors, ...
plot(twp, twp2, twp3, type = c("l", "b", "p"), 
     main = paste ("State Variable", names(ini)), 
     col = c("red", "blue", "orange"), cex = 2)

## =============================================================================
## Assume we have two 'data sets':
## =============================================================================
# data set in 'wide' format
obs1 <- cbind(time = c(0, 0.5, 1), Tet = c(0.4, 0.0, -0.4))

# data set in 'long' format
obs2 <- data.frame(name = "Tet", time = c(0, 0.5, 1), value = c(0.35, 0.0, -0.35))

plot(twp, twp2, obs = obs1, obspar = list(pch = 16, cex = 1.5))

plot(twp, twp2, obs = list(obs1, obs2), 
    obspar = list(pch = 16, cex = 1.5))

plot(twp, twp2, obs = list(obs1, obs2), which = c("Tet", "Q"),
    obspar = list(pch = 16:17, cex = 1.5, col = c("red", "black"))
    )





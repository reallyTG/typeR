library(FME)


### Name: modFit
### Title: Constrained Fitting of a Model to Data
### Aliases: modFit summary.modFit deviance.modFit coef.modFit
###   residuals.modFit df.residual.modFit plot.modFit print.summary.modFit
### Keywords: utilities

### ** Examples


## =======================================================================
## logistic growth model
## =======================================================================
TT    <- seq(1, 60, 5)
N0    <- 0.1
r     <- 0.5
K     <- 100

## perturbed analytical solution
Data <- data.frame(
  time = TT,
     N = K / (1+(K/N0-1) * exp(-r*TT)) * (1 + rnorm(length(TT), sd = 0.01))
)

plot(TT, Data[,"N"], ylim = c(0, 120), pch = 16, col = "red",
     main = "logistic growth", xlab = "time", ylab = "N")


##===================================
## Fitted with analytical solution  #
##===================================

## initial "guess"
parms <- c(r = 2, K = 10, N0 = 5)

## analytical solution
model <- function(parms,time)
  with (as.list(parms), return(K/(1+(K/N0-1)*exp(-r*time))))

## run the model with initial guess and plot results
lines(TT, model(parms, TT), lwd = 2, col = "green")

## FITTING algorithm 1
ModelCost <- function(P) {
 out <- model(P, TT)
 return(Data$N-out)  # residuals
}

(Fita <- modFit(f = ModelCost, p = parms))

times <- 0:60
lines(times, model(Fita$par, times), lwd = 2, col = "blue")
summary(Fita)

##===================================
##  Fitted with numerical solution  #
##===================================

## numeric solution
logist <- function(t, x, parms) {
  with(as.list(parms), {
    dx <- r * x[1] * (1 - x[1]/K)
    list(dx)
  })
}

## model cost,
ModelCost2 <- function(P) {
 out <- ode(y = c(N = P[["N0"]]), func = logist, parms = P, times = c(0, TT))
 return(modCost(out, Data))  # object of class modCost
}

Fit <- modFit(f = ModelCost2, p = parms, lower = rep(0, 3),
              upper = c(5, 150, 10))

out <- ode(y = c(N = Fit$par[["N0"]]), func = logist, parms = Fit$par,
           times = times)

lines(out, col = "red", lty = 2)
legend("right", c("data", "original", "fitted analytical", "fitted numerical"),
       lty = c(NA, 1, 1, 2), lwd = c(NA, 2, 2, 1),
       col = c("red", "green", "blue", "red"), pch = c(16, NA, NA, NA))
summary(Fit)
plot(residuals(Fit))

## =======================================================================
## the use of the Jacobian
## =======================================================================

## We use modFit to solve a set of linear equations
A <- matrix(nr = 30, nc = 30, runif(900))
X <- runif(30)
B <- A %*% X

## try to find vector "X"; the Jacobian is matrix A

## Function that returns the vector of residuals
FUN <- function(x)
  as.vector(A %*% x - B)

## Function that returns the Jacobian
JAC <- function(x) A

## The port algorithm
print(system.time(
  mf <- modFit(f = FUN, p = runif(30), method = "Port")
))
print(system.time(
  mf <- modFit(f = FUN, p = runif(30), method = "Port", jac = JAC)
))
max(abs(mf$par - X))  # should be very small

## BFGS
print(system.time(
  mf <- modFit(f = FUN, p = runif(30), method = "BFGS")
))
print(system.time(
  mf <- modFit(f = FUN, p = runif(30), method = "BFGS", jac = JAC)
))
max(abs(mf$par - X))

## Levenberg-Marquardt
print(system.time(
  mf <- modFit(f = FUN, p = runif(30), jac = JAC)
))
max(abs(mf$par - X))




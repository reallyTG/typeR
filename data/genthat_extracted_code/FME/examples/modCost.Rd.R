library(FME)


### Name: modCost
### Title: Calculates the Discrepancy of a Model Solution with Observations
### Aliases: modCost
### Keywords: utilities

### ** Examples


## =======================================================================
## Type 1 input:  name, time, value
## =======================================================================

## Create new data: two observed variables, "a", "b"
Data <- data.frame(name = c(rep("a", 4), rep("b", 4)),
                   time = c(1:4, 2:5), val = c(runif(4), 1:4))

## "a nonsense model"
Mod <- function (t, y, par) {
  da <- 0
  db <- 1
  return(list(c(da, db)))
}

out <- ode(y = c(a = 0.5, b = 0.5), times = 0:6, func = Mod, parms = NULL)

Data   # Show
out

## The cost function
modCost(model = out, obs = Data, y = "val")

## The cost function with a data error added
Dat2 <- cbind(Data, Err = Data$val*0.1)  # error = 10% of value
modCost(model = out, obs = Dat2, y = "val", err = "Err")


## =======================================================================
## Type 2 input:  Matrix format; column names = variable names
## =======================================================================

## logistic growth model
TT    <- seq(1, 100, 2.5)
N0    <- 0.1
r     <- 0.5
K     <- 100

## analytical solution
Ana <- cbind(time = TT, N = K/(1 + (K/N0 - 1) * exp(-r*TT)))

## numeric solution
logist <- function(t, x, parms) {
  with(as.list(parms), {
    dx <- r * x[1] * (1 - x[1]/K)
    list(dx)
  })
}

time  <- 0:100
parms <- c(r = r, K = K)
x     <- c(N = N0)

## Compare several numerical solutions
Euler <- ode(x, time, logist, parms, hini = 2, method = "euler")
Rk4   <- ode(x, time, logist, parms, hini = 2, method = "rk4")
Lsoda <- ode(x, time, logist, parms) # lsoda is default method
Ana2  <- cbind(time = time, N = K/(1 + (K/N0 - 1) * exp(-r * time)))

## the SSR and residuals with respect to the "data"
cEuler <- modCost(Euler, Ana)$model
cRk4   <- modCost(Rk4  , Ana)$model
cLsoda <- modCost(Lsoda, Ana)$model
cAna   <- modCost(Ana2 , Ana)$model
compare <- data.frame(method = c("euler", "rk4", "lsoda", "Ana"),
                      cost   = c(cEuler, cRk4, cLsoda, cAna))
## Plot Euler, RK and analytic solution
plot(Euler, Rk4, col = c("red", "blue"), obs = Ana,  
     main = "logistic growth", xlab = "time", ylab = "N")

legend("bottomright", c("exact", "euler", "rk4"), pch = c(1, NA, NA),
       col = c("black", "red", "blue"), lty = c(NA, 1, 2))
legend("right", ncol = 2, title = "SSR",
       legend = c(as.character(compare[,1]), 
                  format(compare[,2], digits = 2)))

compare

## =======================================================================
## Now suppose we do not know K and r and they are to be fitted...
## The "observations" are the analytical solution
## =======================================================================

## Run the model with initial guess: K = 10, r = 2
parms["K"] <- 10
parms["r"] <-  2

init <-  ode(x, time, logist, parms)

## FITTING algorithm uses modFit
## First define the objective function (model cost) to be minimised

## more general: using modFit
Cost <- function(P) {
  parms["K"] <- P[1]
  parms["r"] <- P[2]
  out <- ode(x, time, logist, parms)
  return(modCost(out, Ana))
}
(Fit<-modFit(p = c(K = 10, r = 2), f = Cost))

summary(Fit)

## run model with the optimized value:
parms[c("K", "r")] <- Fit$par
fitted <-  ode(x, time, logist, parms)

## show results, compared with "observations"
plot(init, fitted, col = c("green", "blue"), lwd = 2, lty = 1, 
     obs = Ana, obspar = list(col = "red", pch = 16, cex = 2), 
     main = "logistic growth", xlab = "time", ylab = "N")

legend("right", c("initial", "fitted"), col = c("green", "blue"), lwd = 2)

Cost(Fit$par)





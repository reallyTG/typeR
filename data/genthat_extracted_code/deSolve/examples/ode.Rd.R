library(deSolve)


### Name: ode
### Title: General Solver for Ordinary Differential Equations
### Aliases: ode print.deSolve summary.deSolve
### Keywords: math

### ** Examples


## =======================================================================
## Example1: Predator-Prey Lotka-Volterra model (with logistic prey)
## =======================================================================

LVmod <- function(Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    Ingestion    <- rIng  * Prey * Predator
    GrowthPrey   <- rGrow * Prey * (1 - Prey/K)
    MortPredator <- rMort * Predator

    dPrey        <- GrowthPrey - Ingestion
    dPredator    <- Ingestion * assEff - MortPredator

    return(list(c(dPrey, dPredator)))
  })
}

pars  <- c(rIng   = 0.2,    # /day, rate of ingestion
           rGrow  = 1.0,    # /day, growth rate of prey
           rMort  = 0.2 ,   # /day, mortality rate of predator
           assEff = 0.5,    # -, assimilation efficiency
           K      = 10)     # mmol/m3, carrying capacity

yini  <- c(Prey = 1, Predator = 2)
times <- seq(0, 200, by = 1)
out   <- ode(yini, times, LVmod, pars)
summary(out)

## Default plot method
plot(out)

## User specified plotting
matplot(out[ , 1], out[ , 2:3], type = "l", xlab = "time", ylab = "Conc",
        main = "Lotka-Volterra", lwd = 2)
legend("topright", c("prey", "predator"), col = 1:2, lty = 1:2)

## =======================================================================
## Example2: Substrate-Producer-Consumer Lotka-Volterra model
## =======================================================================

## Note:
## Function sigimp passed as an argument (input) to model
##   (see also lsoda and rk examples)

SPCmod <- function(t, x, parms, input)  {
  with(as.list(c(parms, x)), {
    import <- input(t)
    dS <- import - b*S*P + g*C    # substrate
    dP <- c*S*P  - d*C*P          # producer
    dC <- e*P*C  - f*C            # consumer
    res <- c(dS, dP, dC)
    list(res)
  })
}

## The parameters 
parms <- c(b = 0.001, c = 0.1, d = 0.1, e = 0.1, f = 0.1, g = 0.0)

## vector of timesteps
times <- seq(0, 200, length = 101)

## external signal with rectangle impulse
signal <- data.frame(times = times,
                     import = rep(0, length(times)))

signal$import[signal$times >= 10 & signal$times <= 11] <- 0.2

sigimp <- approxfun(signal$times, signal$import, rule = 2)

## Start values for steady state
xstart <- c(S = 1, P = 1, C = 1)

## Solve model
out <- ode(y = xstart, times = times,
           func = SPCmod, parms = parms, input = sigimp)

## Default plot method
plot(out)

## User specified plotting
mf <- par(mfrow = c(1, 2))
matplot(out[,1], out[,2:4], type = "l", xlab = "time", ylab = "state")
legend("topright", col = 1:3, lty = 1:3, legend = c("S", "P", "C"))
plot(out[,"P"], out[,"C"], type = "l", lwd = 2, xlab = "producer",
  ylab = "consumer")
par(mfrow = mf)

## =======================================================================
## Example3: Discrete time model - using method = "iteration"
##           The host-parasitoid model from Soetaert and Herman, 2009, 
##           Springer - p. 284.
## =======================================================================

Parasite <- function(t, y, ks) {
  P <- y[1]
  H <- y[2]
  f    <- A * P / (ks + H)
  Pnew <- H * (1 - exp(-f))
  Hnew <- H * exp(rH * (1 - H) - f)
  
  list (c(Pnew, Hnew))
}
rH <- 2.82 # rate of increase
A  <- 100  # attack rate
ks <- 15   # half-saturation density

out <- ode(func = Parasite, y = c(P = 0.5, H = 0.5), times = 0:50, parms = ks,
           method = "iteration")
            
out2<- ode(func = Parasite, y = c(P = 0.5, H = 0.5), times = 0:50, parms = 25,
           method = "iteration")

out3<- ode(func = Parasite, y = c(P = 0.5, H = 0.5), times = 0:50, parms = 35,
           method = "iteration")

## Plot all 3 scenarios in one figure
plot(out, out2, out3, lty = 1, lwd = 2)

## Same like "out", but *output* every two steps
## hini = 1 ensures that the same *internal* timestep of 1 is used
outb <- ode(func = Parasite, y = c(P = 0.5, H = 0.5),
            times = seq(0, 50, 2), hini = 1, parms = ks,
            method = "iteration")
plot(out, outb, type = c("l", "p"))

## Not run: 
##D ## =======================================================================
##D ## Example4: Playing with the Jacobian options - see e.g. lsoda help page
##D ##
##D ## IMPORTANT: The following example is temporarily broken because of 
##D ##            incompatibility with R 3.0 on some systems.
##D ##            A fix is on the way.
##D ## =======================================================================
##D 
##D ## a stiff equation, exponential decay, run 500 times
##D stiff <- function(t, y, p) {   # y and r are a 500-valued vector
##D   list(- r * y)
##D }
##D 
##D N    <- 500
##D r    <- runif(N, 15, 20)
##D yini <- runif(N, 1, 40)
##D 
##D times <- 0:10
##D 
##D ## Using the default
##D print(system.time(
##D   out <- ode(y = yini, parms = NULL, times = times, func = stiff)
##D ))
##D # diagnostics(out) shows that the method used = bdf (2), so it it stiff
##D 
##D ## Specify that the Jacobian is banded, with nonzero values on the 
##D ## diagonal, i.e. the bandwidth up and down = 0 
##D 
##D print(system.time(
##D   out2 <- ode(y = yini, parms = NULL, times = times, func = stiff,
##D               jactype = "bandint", bandup = 0, banddown = 0)
##D ))
##D 
##D ## Now we also specify the Jacobian function
##D 
##D jacob <- function(t, y, p) -r
##D 
##D print(system.time(
##D   out3 <- ode(y = yini, parms = NULL, times = times, func = stiff, 
##D               jacfunc = jacob, jactype = "bandusr", 
##D               bandup = 0, banddown = 0)
##D ))
##D ## The larger the value of N, the larger the time gain...
## End(Not run)




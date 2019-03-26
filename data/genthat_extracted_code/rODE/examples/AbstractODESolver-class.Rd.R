library(rODE)


### Name: AbstractODESolver-class
### Title: AbstractODESolver class
### Aliases: AbstractODESolver-class .AbstractODESolver AbstractODESolver
###   step,AbstractODESolver-method getODE,AbstractODESolver-method
###   setStepSize,AbstractODESolver-method init,AbstractODESolver-method
###   init<-,AbstractODESolver-method getStepSize,AbstractODESolver-method
###   AbstractODESolver,missing-method AbstractODESolver,ODE-method

### ** Examples

# This is how we start defining a new ODE solver: Euler
.Euler <- setClass("Euler",              # Euler solver very simple; no slots
     contains = c("AbstractODESolver"))



# Here we define the ODE solver Verlet
.Verlet <- setClass("Verlet", slots = c(
    rate1 = "numeric",                          # Verlet calculates two rates
    rate2 = "numeric",
    rateCounter = "numeric"),
contains = c("AbstractODESolver"))



# This is the definition of the ODE solver Runge-Kutta 4
.RK4 <- setClass("RK4", slots = c(       # On the other hand RK4 uses 4 rates
   rate1 = "numeric",
   rate2 = "numeric",
   rate3 = "numeric",
   rate4 = "numeric",
   estimated_state = "numeric"),         # and estimates another state
contains = c("AbstractODESolver"))





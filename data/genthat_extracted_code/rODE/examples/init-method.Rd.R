library(rODE)


### Name: init
### Title: init
### Aliases: init init<-

### ** Examples

# init method in Kepler.R
setMethod("init", "Kepler", function(object, initState, ...) {
    object@state <- initState
    object@odeSolver <- init(object@odeSolver, getStepSize(object@odeSolver))
    object@counter <- 0
    object
})

# init method in LogisticApp.R
setMethod("init", "Logistic", function(object, initState, r, K, ...) {
    object@r <- r
    object@K <- K
    object@state <- initState
    object@odeSolver <- init(object@odeSolver, getStepSize(object@odeSolver))
    object@counter <- 0
    object
})

# init method in Planet.R
setMethod("init", "Planet", function(object, initState, ...) {
    object@state <- object@odeSolver@ode@state <- initState
    # initialize providing the step size
    object@odeSolver <- init(object@odeSolver, getStepSize(object@odeSolver))
    object@rate <- object@odeSolver@ode@rate
    object@state <- object@odeSolver@ode@state
    object
})




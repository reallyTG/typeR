library(simecol)


### Name: initialize-methods
### Title: Methods for Function 'initialize' in Package 'simecol'
### Aliases: initialize-methods initialize,simObj-method
### Keywords: methods

### ** Examples

## Note: new calls initialize and initialize calls initfunc(obj)
lv_efr <- new("odeModel",
  main = function (time, init, parms, ...) {
    x <- init
    p <- parms
    S <- approxTime1(inputs, time, rule=2)["s.in"]
    dx1 <-   S * p["k1"] * x[1] - p["k2"] * x[1] * x[2]
    dx2 <-     - p["k3"] * x[2] + p["k2"] * x[1] * x[2]
    list(c(dx1, dx2))
  },
  parms  = c(k1=0.2, k2=0.2, k3=0.2),
  times  = c(from=0, to=100, by=0.5),
  init   = c(prey=0.5, predator=1),
  solver = "lsoda",
  initfunc = function(obj) {
    tt <- fromtoby(times(obj))
    inputs(obj) <- as.matrix(data.frame(
            time = tt,
            s.in = pmax(rnorm(tt, mean=1, sd=0.5), 0)
          ))
    obj
  }
)
plot(sim(lv_efr))                     # initialize called automatically
plot(sim(lv_efr))                     # automatic initialization, different figure

lv_efr<- initialize(lv_efr)           # re-initialize manually
plot(sim(lv_efr, initialize = FALSE)) # simulation with that configuration
    





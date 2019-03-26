library(simecol)


### Name: lv3
### Title: Lotka-Volterra-Type Model with Resource, Prey and Predator
### Aliases: lv3
### Keywords: datasets

### ** Examples

##============================================
## Basic Usage:
##   explore the example
##============================================
data(lv3)
plot(sim(lv3))
times(lv3)["by"] <- 5    # set maximum external time step to a large value
plot(sim(lv3))           # wrong! automatic time step overlooks internal inputs
plot(sim(lv3, hmax = 1)) # integration with correct maximum internal time step

##============================================
## Implementation:
##   The code of the model
##============================================
lv3 <- new("odeModel",
  main = function(time, init, parms, inputs) {
    s.in <- approxTime1(inputs, time, rule = 2)["s.in"]
    with(as.list(c(init, parms)),{
      ds <- s.in  - b*s*p + g*k
      dp <- c*s*p - d*k*p
      dk <- e*p*k - f*k
      list(c(ds, dp, dk), s.in = s.in)
    })
  },
  parms = c(b = 0.1, c = 0.1, d = 0.1, e = 0.1, f = 0.1, g = 0),
  times  = c(from = 0, to = 200, by = 1),
  inputs = as.matrix(
    data.frame(
      time = c(0,   99, 100,  101, 200),
      s.in = c(0.1, 0.1, 0.5, 0.1, 0.1)
    )
  ),
  init = c(s = 1, p = 1, k = 1), # substrate, producer, consumer
  solver = "lsoda"
)  




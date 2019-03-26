## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE
  , comment = "#>"
  , fig.width = 7
)
library(ODEnetwork)

## ------------------------------------------------------------------------
mass = 1
damper = matrix(0.1)
spring = matrix(1)
odenet = ODEnetwork(masses = mass, dampers = damper, springs = spring)

## ------------------------------------------------------------------------
position = 1
velocity = 0
odenet = setState(odenet = odenet, state1 = position, state2 = velocity)

## ------------------------------------------------------------------------
odenet = simuNetwork(odenet = odenet, times = seq(0, 20))
plot(odenet, state = "1")

## ------------------------------------------------------------------------
odenet$simulation$method

## ------------------------------------------------------------------------
odenet = simuNetwork(odenet = odenet, times = seq(0, 20, 0.01))
plot(odenet, state = "1")

## ------------------------------------------------------------------------
mass = 1:3
damper = diag(rep(0.1, 3))
damper[1, 2] = 0.1
damper[2, 3] = 0.1
spring = diag(rep(1, 3))
spring[1, 2] = 1
spring[2, 3] = 1
odenet = ODEnetwork(masses = mass, dampers = damper, springs = spring)

## ------------------------------------------------------------------------
position = rep(1, 3)
velocity = c(0, 1, -1)
odenet = setState(odenet = odenet, state1 = position, state2 = velocity)

## ---- include = FALSE----------------------------------------------------
odenet = simuNetwork(odenet = odenet, times = seq(0, 20, 0.01))

## ---- eval = FALSE-------------------------------------------------------
#  odenet = simuNetwork(odenet = odenet, times = seq(0, 20, 0.01))
#  plot(odenet, state = "1")

## ---- echo = FALSE-------------------------------------------------------
plot(odenet, state = "1", var = 1)
plot(odenet, state = "1", var = 2)
plot(odenet, state = "1", var = 3)

## ---- fig.height = 7-----------------------------------------------------
plot(odenet, state = "1vs2", var = 1)

## ------------------------------------------------------------------------
calcResonances(odenet)

## ------------------------------------------------------------------------
odenet = estimateDistances(odenet, equilibrium = c(1, 2, 3))
odenet$distances
odenet = estimateDistances(odenet, equilibrium = c(1, 2, 3), distGround = "individual")
odenet$distances

## ------------------------------------------------------------------------
mass = c(1, 2)
damper = diag(c(0.02, 0.1))
damper[1, 2] = 0.1
spring =  diag(c(4, 1))
spring[1, 2] = 2
distance = matrix(c(0, 0, 1, 0), ncol = 2)
odenet = ODEnetwork(mass, damper, spring, distances = distance)
odenet = setState(odenet, c(1, 1), c(0, 0))
odenet = simuNetwork(odenet, seq(0, 20, by = 0.01))

## ------------------------------------------------------------------------
plot(odenet, state = "1")

## ------------------------------------------------------------------------
eventdata = data.frame(var = c("x.1", "x.1", "x.1")
                       , time = c(5, 10, 12)
                       , value = c(0, 1, 1)
                       )
odenet = setEvents(odenet, eventdata, type = "constant")
odenet = simuNetwork(odenet, seq(0, 20, by = 0.01))
plot(odenet, state = "1")

## ------------------------------------------------------------------------
odenet$simulation$method


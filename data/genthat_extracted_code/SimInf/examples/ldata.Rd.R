library(SimInf)


### Name: ldata
### Title: Extract local data from a node
### Aliases: ldata

### ** Examples

## Create an 'SISe' model with 1600 nodes.
model <- SISe(u0 = u0_SISe(), tspan = 1:100, events = events_SISe(),
              phi = 0, upsilon = 1.8e-2, gamma = 0.1, alpha = 1,
              beta_t1 = 1.0e-1, beta_t2 = 1.0e-1, beta_t3 = 1.25e-1,
              beta_t4 = 1.25e-1, end_t1 = c(91, 101), end_t2 = c(182, 185),
              end_t3 = c(273, 275), end_t4 = c(365, 360), epsilon = 0)

## Display local data from the first two nodes.
ldata(model, node = 1)
ldata(model, node = 2)




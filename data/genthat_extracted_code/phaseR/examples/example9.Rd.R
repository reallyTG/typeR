library(phaseR)


### Name: example9
### Title: Example ODE System 9
### Aliases: example9

### ** Examples

# Plot the velocity field, nullclines and several trajectories
example9.flowField  <- flowField(example9,
                                 xlim = c(-3, 3),
                                 ylim = c(-3, 3),
                                 points = 19,
                                 add = FALSE)
y0                  <- matrix(c(1, 0, -3, 2,
                                2, -2, -2, -2), 4, 2,
                              byrow = TRUE)
example9.nullclines <- nullclines(example9,
                                  xlim = c(-3, 3),
                                  ylim = c(-3, 3))
example9.trajectory <- trajectory(example9,
                                  y0 = y0,
                                  tlim = c(0, 10))
example9.manifolds  <- drawManifolds(example9,
                                     y0 = c(0, 0),
                                     tend = 10,
                                     col = c("green", "red"),
                                     add.legend = TRUE)
# Determine the stability of the equilibrium point
example9.stability  <- stability(example9,
                                 ystar = c(0, 0))




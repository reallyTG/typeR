library(phaseR)


### Name: example4
### Title: Example ODE System 4
### Aliases: example4

### ** Examples

# Plot the velocity field, nullclines and several trajectories
example4.flowField  <- flowField(example4,
                                 xlim = c(-3, 3),
                                 ylim = c(-5, 5),
                                 points = 19,
                                 add = FALSE)
y0                  <- matrix(c(1, 0, -1, 0, 2, 2,
                                -2, 2, -3, -4), 5, 2,
                              byrow = TRUE)
example4.nullclines <- nullclines(example4,
                                  xlim = c(-3, 3),
                                  ylim = c(-5, 5))
example4.trajectory <- trajectory(example4,
                                  y0 = y0,
                                  tlim = c(0,10))




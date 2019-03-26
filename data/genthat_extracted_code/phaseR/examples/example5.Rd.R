library(phaseR)


### Name: example5
### Title: Example ODE System 5
### Aliases: example5

### ** Examples

# Plot the velocity field, nullclines, manifolds and several trajectories
example5.flowField         <- flowField(example5,
                                        xlim = c(-3, 3),
                                        ylim = c(-3, 3),
                                        points = 19,
                                        add = FALSE)
y0                         <- matrix(c(1, 0, -1, 0, 2, 2,
                                       -2, 2, 0, 3, 0, -3), 6, 2,
                                     byrow = TRUE)
example5.nullclines        <- nullclines(example5,
                                         xlim = c(-3, 3),
                                         ylim = c(-3, 3))
example5.trajectory        <- trajectory(example5,
                                         y0 = y0,
                                         tlim = c(0,10))
example5.manifolds         <- drawManifolds(example5,
                                            y0 = c(0, 0),
                                            tend = 100,
                                            col = c("green", "red"),
                                            add.legend = TRUE)
# Plot x and y against t
example5.numericalSolution <- numericalSolution(example5,
                                                y0 = c(0, 3),
                                                tlim = c(0, 3))
# Determine the stability of the equilibrium point
example5.stability         <- stability(example5,
                                        ystar = c(0, 0))




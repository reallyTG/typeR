library(phaseR)


### Name: vanDerPol
### Title: The Van Der Pol Oscillator
### Aliases: vanDerPol

### ** Examples

# Plot the velocity field, nullclines and several trajectories.
vanDerPol.flowField         <- flowField(vanDerPol,
                                         xlim = c(-5, 5),
                                         ylim = c(-5, 5),
                                         parameters = 3,
                                         points = 15,
                                         add = FALSE)
y0                          <- matrix(c(2, 0, 0, 2, 0.5, 0.5), 3, 2,
                                      byrow = TRUE)
vanDerPol.nullclines        <- nullclines(vanDerPol,
                                          xlim = c(-5, 5),
                                          ylim = c(-5, 5),
                                          parameters = 3,
                                          points = 500)
vanDerPol.trajectory        <- trajectory(vanDerPol,
                                          y0 = y0,
                                          tlim = c(0, 10),
                                          parameters = 3)
# Plot x and y against t
vanDerPol.numericalSolution <- numericalSolution(vanDerPol,
                                                 y0 = c(4, 2),
                                                 tlim = c(0, 100),
                                                 parameters = 3)
# Determine the stability of the equilibrium point
vanDerPol.stability         <- stability(vanDerPol,
                                         ystar = c(0, 0),
                                         parameters = 3)




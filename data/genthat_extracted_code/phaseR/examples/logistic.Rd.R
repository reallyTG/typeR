library(phaseR)


### Name: logistic
### Title: The Logistic Growth Model
### Aliases: logistic

### ** Examples

# Plot the velocity field, nullclines and several trajectories
logistic.flowField     <- flowField(logistic,
                                    xlim = c(0, 5),
                                    ylim = c(-1, 3),
                                    parameters = c(1, 2),
                                    points = 21,
                                    system = "one.dim",
                                    add = FALSE)
logistic.nullclines    <- nullclines(logistic,
                                     xlim = c(0, 5),
                                     ylim = c(-1, 3),
                                     parameters = c(1, 2),
                                     system = "one.dim")
logistic.trajectory    <- trajectory(logistic,
                                     y0 = c(-0.5, 0.5, 1.5, 2.5),
                                     tlim = c(0, 5),
                                     parameters = c(1, 2),
                                     system = "one.dim")
# Plot the phase portrait
logistic.phasePortrait <- phasePortrait(logistic,
                                        ylim = c(-0.5, 2.5),
                                        parameters = c(1, 2),
                                        points = 10,
                                        frac = 0.5)
# Determine the stability of the equilibrium points
logistic.stability.1   <- stability(logistic,
                                    ystar = 0,
                                    parameters = c(1, 2),
                                    system = "one.dim")
logistic.stability.2   <- stability(logistic,
                                    ystar = 2,
                                    parameters = c(1, 2),
                                    system = "one.dim")




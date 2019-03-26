library(phaseR)


### Name: example2
### Title: Example ODE System 2
### Aliases: example2

### ** Examples

# Plot the flow field and several trajectories
example2.flowField     <- flowField(example2,
                                    xlim = c(0, 4),
                                    ylim = c(-1, 3),
                                    system = "one.dim",
                                    add = FALSE,
                                    xlab = "t")
example2.trajectory    <- trajectory(example2,
                                     y0 = c(-0.5, 0.5, 1.5, 2.5),
                                     tlim = c(0, 4),
                                     system = "one.dim")
# Plot the phase portrait
example2.phasePortrait <- phasePortrait(example2,
                                        ylim = c(-0.5, 2.5),
                                        frac = 0.5)
# Determine the stability of the equilibrium points
example2.stability.1   <- stability(example2,
                                    ystar = 0,
                                    system = "one.dim")
example2.stability.2   <- stability(example2,
                                    ystar = 1,
                                    system = "one.dim")
example2.stability.3   <- stability(example2,
                                    ystar = 2,
                                    system = "one.dim")




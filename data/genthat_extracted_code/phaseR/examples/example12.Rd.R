library(phaseR)


### Name: example12
### Title: Example ODE System 12
### Aliases: example12

### ** Examples

# Plot the velocity field, nullclines and several trajectories
example12.flowField   <- flowField(example12,
                                   xlim = c(-4, 4),
                                   ylim = c(-4, 4),
                                   points = 17,
                                   add = FALSE)
y0                    <- matrix(c(2, 2, -3, 0,
                                  0, 2, 0, -3), 4, 2,
                                byrow = TRUE)
example12.nullclines  <- nullclines(example12,
                                    xlim = c(-4, 4),
                                    ylim = c(-4, 4),
                                    points = 200)
example12.trajectory  <- trajectory(example12,
                                    y0 = y0,
                                    tlim = c(0, 10))
example12.manifolds   <- drawManifolds(example12,
                                       y0 = c(-1, -1),
                                       tend = 1000,
                                       col = c("green", "red"),
                                       add.legend = TRUE)
# Determine the stability of the equilibrium points
example12.stability.1 <- stability(example12,
                                   ystar = c(1, 1))
example12.stability.2 <- stability(example12,
                                   ystar = c(-1, -1))




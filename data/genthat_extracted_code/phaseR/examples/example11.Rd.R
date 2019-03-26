library(phaseR)


### Name: example11
### Title: Example ODE System 11
### Aliases: example11

### ** Examples

# Plot the velocity field, nullclines and several trajectories
example11.flowField   <- flowField(example11,
                                   xlim = c(-5, 5),
                                   ylim = c(-5, 5),
                                   points = 21,
                                   add = FALSE)
y0                    <- matrix(c(4, 4, -1, -1,
                                  -2, 1, 1, -1), 4, 2,
                                byrow = TRUE)
example11.nullclines  <- nullclines(example11,
                                    xlim = c(-5, 5),
                                    ylim = c(-5, 5),
                                    points = 200)
example11.trajectory  <- trajectory(example11,
                                    y0 = y0,
                                    tlim = c(0, 10))
example11.manifolds   <- drawManifolds(example11,
                                       y0 = c(1, 1),
                                       tend = 1000,
                                       col = c("green", "red"),
                                       add.legend = TRUE)
# Determine the stability of the equilibrium points
example11.stability.1 <- stability(example11, ystar = c(0, 0))
example11.stability.2 <- stability(example11, ystar = c(0, 2))
example11.stability.3 <- stability(example11, ystar = c(1, 1))
example11.stability.4 <- stability(example11, ystar = c(3, 0))




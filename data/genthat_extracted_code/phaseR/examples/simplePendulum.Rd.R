library(phaseR)


### Name: simplePendulum
### Title: The Simple Pendulum Model
### Aliases: simplePendulum

### ** Examples

# Plot the velocity field, nullclines and several trajectories
simplePendulum.flowField   <- flowField(simplePendulum,
                                        xlim = c(-7, 7),
                                        ylim = c(-7, 7),
                                        parameters = 5,
                                        points = 19,
                                        add = FALSE)
y0                         <- matrix(c(0, 1, 0, 4, -6, 1, 5, 0.5, 0, -3),
                                     5, 2, byrow = TRUE)
simplePendulum.nullclines  <- nullclines(simplePendulum,
                                         xlim = c(-7, 7),
                                         ylim = c(-7, 7),
                                         parameters = 5,
                                         points = 500)
simplePendulum.trajectory  <- trajectory(simplePendulum,
                                         y0 = y0,
                                         tlim = c(0, 10),
                                         parameters = 5)
simplePendulum.manifolds   <- drawManifolds(simplePendulum,
                                            y0 = c(pi, 0),
                                            parameters = 5,
                                            tend = 1000,
                                            col = c("green", "red"),
                                            add.legend = TRUE)
# Determine the stability of two equilibrium points
simplePendulum.stability.1 <- stability(simplePendulum,
                                        ystar = c(0, 0),
                                        parameters = 5)
simplePendulum.stability.2 <- stability(simplePendulum,
                                        ystar = c(pi, 0),
                                        parameters = 5)




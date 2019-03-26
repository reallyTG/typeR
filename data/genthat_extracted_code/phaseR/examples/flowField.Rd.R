library(phaseR)


### Name: flowField
### Title: Flow Field
### Aliases: flowField

### ** Examples

# Plot the flow field, nullclines and several trajectories for the one
# dimensional autonomous ODE system logistic.
logistic.flowField <- flowField(logistic, xlim = c(0, 5), ylim = c(-1, 3),
                                parameters = c(1, 2), points = 21, system = "one.dim",
								add = FALSE)
logistic.nullclines <- nullclines(logistic, xlim = c(0, 5), ylim = c(-1, 3),
                                  parameters = c(1, 2), system = "one.dim")
logistic.trajectory <- trajectory(logistic, y0 = c(-0.5, 0.5, 1.5, 2.5), tlim = c(0, 5),
                                  parameters = c(1, 2), system = "one.dim")

# Plot the velocity field, nullclines and several trajectories for the two dimensional
# autonomous ODE system simplePendulum.
simplePendulum.flowField  <- flowField(simplePendulum, xlim = c(-7, 7),
                                       ylim = c(-7, 7), parameters = 5, points = 19,
									   add = FALSE)
y0                        <- matrix(c(0, 1, 0, 4, -6, 1, 5, 0.5, 0, -3), ncol = 2,
                                    nrow = 5, byrow = TRUE)
simplePendulum.nullclines <- nullclines(simplePendulum, xlim = c(-7, 7),
                                        ylim = c(-7, 7), parameters = 5, points = 500)
simplePendulum.trajectory <- trajectory(simplePendulum, y0 = y0, tlim = c(0, 10),
                                        parameters = 5)





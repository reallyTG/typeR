## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = F-----------------------------------------------------------
#  drawManifolds(deriv, y0 = NULL, parameters = NULL,
#                tend = 1000, col = c("green", "red"),
#                add.legend = TRUE, ...)

## ---- eval = F-----------------------------------------------------------
#  findEquilibrium(deriv, y0 = NULL, parameters = NULL,
#                  system = "two.dim", tol = 1e-16, max.iter = 50,
#                  h = 1e-6, plot.it = FALSE, summary = TRUE)

## ---- eval = F-----------------------------------------------------------
#  flowField(deriv, xlim, ylim, parameters = NULL,
#            system = "two.dim", points = 21, col = "gray",
#            arrow.type = "equal", arrow.head = 0.05, frac = 1,
#            add = TRUE, xlab = "x", ylab = "y", ...)

## ---- eval = F-----------------------------------------------------------
#  nullclines(deriv, xlim, ylim, parameters = NULL,
#             system = "two.dim", points = 101,
#             col = c("blue", "cyan"), add = TRUE,
#             add.legend = TRUE, ...)

## ---- eval = F-----------------------------------------------------------
#  numericalSolution(deriv, y0 = NULL, tlim, tstep = 0.01,
#                    parameters = NULL, type = "two",
#                    col = c("red", "blue"), add.grid = TRUE,
#                    add.legend = TRUE, ...)

## ---- eval = F-----------------------------------------------------------
#  phasePlaneAnalysis(deriv, xlim, ylim, tend = 100,
#                     parameters = NULL, system = "two.dim",
#                     add = FALSE)

## ---- eval = F-----------------------------------------------------------
#  phasePortrait(deriv, ylim, ystep = 0.01, parameters = NULL,
#                points = 10, frac = 0.75, arrow.head = 0.075,
#                col = "black", xlab = "y", ylab = "f(y)",
#                add.grid = TRUE, ...)

## ---- eval = F-----------------------------------------------------------
#  stability(deriv, ystar = NULL, parameters = NULL,
#            system = "two.dim", h = 1e-07, summary = TRUE)

## ---- eval = F-----------------------------------------------------------
#  trajectory(deriv, y0 = NULL, n = NULL, tlim, tstep = 0.01,
#             parameters = NULL, system = "two.dim", col = "black",
#             add = TRUE, ...)

## ---- eval = F-----------------------------------------------------------
#  derivative <- function(t, y, parameters) {
#    # Enter derivative computation here
#    list(dy)
#  }

## ---- eval = F-----------------------------------------------------------
#  derivative <- function(t, y, parameters) {
#    x     <- y[1]
#    y     <- y[2]
#    dy    <- numeric(2)
#    dy[1] <- 3*y
#    dy[2] <- 2*x
#    list(dy)
#  }

## ---- eval = F-----------------------------------------------------------
#  derivative <- function(t, y, parameters) {
#    alpha <- parameters[1]
#    beta  <- parameters[2]
#    x     <- y[1]
#    y     <- y[2]
#    dy    <- numeric(2)
#    dy[1] <- alpha*y
#    dy[2] <- beta*x
#    list(dy)
#  }

## ---- eval = F-----------------------------------------------------------
#  derivative <- function(t, y, parameters) {
#    a  <- parameters[1]
#    b  <- parameters[2]
#    dy <- a*(b – 3 - y)^2
#    list(dy)
#  }

## ---- eval = F-----------------------------------------------------------
#  example2.flowField  <- flowField(example2, xlim = c(0, 4),
#                                   ylim = c(-1, 3),
#                                   system = "one.dim",
#                                   add = FALSE, xlab = "t")
#  grid()
#  example2.nullclines <- nullclines(example2, xlim = c(0, 4),
#                                    ylim = c(-1, 3),
#                                    system = "one.dim")
#  example2.trajectory <- trajectory(example2,
#                                    y0 = c(-0.5, 0.5, 1.5, 2.5),
#                                    tlim = c(0, 4),
#                                    system = "one.dim")

## ---- eval = F-----------------------------------------------------------
#  example2.phasePortrait <- phasePortrait(example2,
#                                          ylim = c(-0.5, 2.5))

## ---- eval = F-----------------------------------------------------------
#  example2.stability.1 <- stability(example2, ystar = 0,
#                                    system = "one.dim")
#  example2.stability.2 <- stability(example2, ystar = 1,
#                                    system = "one.dim")
#  example2.stability.3 <- stability(example2, ystar = 2,
#                                    system = "one.dim")

## ---- eval = F-----------------------------------------------------------
#  logistic.flowField  <- flowField(logistic, xlim = c(0, 5),
#                                   ylim = c(-1, 3),
#                                   parameters = c(1, 2),
#                                   system = "one.dim",
#                                   add = FALSE, xlab = "t")
#  grid()
#  logistic.nullclines <- nullclines(logistic, xlim = c(0, 5),
#                                    ylim = c(-1, 3),
#                                    parameters = c(1, 2),
#                                    system = "one.dim")
#  logistic.trajectory <- trajectory(logistic,
#                                    y0 = c(-0.5, 0.5, 1.5, 2.5),
#                                    tlim = c(0, 5),
#                                    parameters = c(1, 2),
#                                    system = "one.dim")

## ---- eval = F-----------------------------------------------------------
#  logistic.phasePortrait <- phasePortrait(logistic,
#                                          ylim = c(-0.5, 2.5),
#                                          parameters = c(1, 2))

## ---- eval = F-----------------------------------------------------------
#  logistic.stability.1 <- stability(logistic, ystar = 0,
#                                    parameters = c(1, 2),
#                                    system = "one.dim")
#  logistic.stability.2 <- stability(logistic, ystar = 2,
#                                    parameters = c(1, 2),
#                                    system = "one.dim")

## ---- eval = F-----------------------------------------------------------
#  example4.flowField  <- flowField(example4, xlim = c(-3, 3),
#                                   ylim = c(-5, 5), add = FALSE)
#  grid()
#  example4.nullclines <- nullclines(example4, xlim = c(-3, 3),
#                                    ylim = c(-5, 5))
#  y0                  <- matrix(c(1, 0, -1, 0, 2, 2, -2, 2, 3,
#                                  -3, -3, -4), nrow = 6,
#                                ncol = 2, byrow = TRUE)
#  example4.trajectory <- trajectory(example4, y0 = y0,
#                                    tlim = c(0, 10))

## ---- eval = F-----------------------------------------------------------
#  example5.flowField  <- flowField(example5, xlim = c(-3, 3),
#                                   ylim = c(-3, 3), add = FALSE)
#  grid()
#  example5.nullclines <- nullclines(example5, xlim = c(-3, 3),
#                                    ylim = c(-3, 3))
#  y0                  <- matrix(c(1, 0, -1, 0, 2, 2, -2, 2, 0, 3,
#                                  0, -3), nrow = 6, ncol = 2,
#                                byrow = TRUE)
#  example5.trajectory <- trajectory(example5, y0 = y0, tlim = c(0, 10))
#  example5.manifolds  <- drawManifolds(example5, y0 = c(0, 0))

## ---- eval = F-----------------------------------------------------------
#  example5.stability <- stability(example5, ystar = c(0, 0))

## ---- eval = F-----------------------------------------------------------
#  example8.flowField  <- flowField(example8, xlim = c(-3, 3),
#                                   ylim = c(-3, 3), add = FALSE)
#  grid()
#  example8.nullclines <- nullclines(example8, xlim = c(-3, 3),
#                                    ylim = c(-3, 3))
#  y0                  <- matrix(c(1, 0, 0, 0.5, 2, -2, -2, -2),
#                                nrow = 4, ncol = 2, byrow = TRUE)
#  example8.trajectory <- trajectory(example8, y0 = y0,
#                                    tlim = c(0, 10))

## ---- eval = F-----------------------------------------------------------
#  > example8.stability <- stability(example8, ystar = c(0, 0))

## ---- eval = F-----------------------------------------------------------
#  example11.flowField  <- flowField(example11, xlim = c(-5, 5),
#                                    ylim = c(-5, 5), add = FALSE)
#  grid()
#  example11.nullclines <- nullclines(example11, xlim = c(-5, 5),                                                            ylim = c(-5, 5), points = 500)
#  y0                   <- matrix(c(4, 4, -1, -1, -2, 1, 1, -1),
#                                 nrow = 4, ncol = 2, byrow = TRUE)
#  example11.trajectory <- trajectory(example11, y0 = y0,
#                                     tlim = c(0, 10))

## ---- eval = F-----------------------------------------------------------
#  example11.stability.1 <- stability(example11, ystar = c(0, 0))
#  example11.stability.2 <- stability(example11, ystar = c(0, 2))
#  example11.stability.3 <- stability(example11, ystar = c(1, 1),
#                                     h = 1e-8)
#  example11.stability.4 <- stability(example11, ystar = c(3, 0))

## ---- eval = F-----------------------------------------------------------
#  example11.manifolds  <- drawManifolds(example11, y0 = c(1, 1))

## ---- eval = F-----------------------------------------------------------
#  example12.flowField  <- flowField(example12, xlim = c(-4, 4),
#                                    ylim = c(-4, 4), add = FALSE)
#  grid()
#  example12.nullclines <- nullclines(example12, xlim = c(-4, 4),
#                                     ylim = c(-4, 4),
#                                     points = 500)
#  y0                   <- matrix(c(2, 2, -3, 0, 0, 2, 0, -3),
#                                 nrow = 4, ncol = 2,
#                                 byrow = TRUE)
#  example12.trajectory <- trajectory(example12, y0 = y0,
#                                     tlim = c(0, 10))

## ---- eval = F-----------------------------------------------------------
#  example12.stability.1 <- stability(example12, ystar = c(1, 1))
#  example12.stability.2 <- stability(example12,
#                                     ystar = c(-1, -1), h = 1e-8)

## ---- eval = F-----------------------------------------------------------
#  simplePendulum.flowField  <- flowField(simplePendulum,
#                                         xlim = c(-7, 7),
#                                         ylim = c(-7, 7),
#                                         parameters = 5,
#                                         add = FALSE)
#  grid()
#  simplePendulum.nullclines <- nullclines(simplePendulum,
#                                          xlim = c(-7, 7),
#                                          ylim = c(-7, 7),
#                                          parameters = 5,
#                                          points = 500)
#  y0                        <- matrix(c(0, 1, 0, 4, -6, 1, 5,
#                                        0.5, 0, -3), nrow = 5,
#                                      ncol = 2, byrow = TRUE)
#  simplePendulum.trajectory <- trajectory(simplePendulum,
#                                          y0 = y0,
#                                          tlim = c(0, 10),
#                                          parameters = 5)

## ---- eval = F-----------------------------------------------------------
#  simplePendulum.stability.1 <- stability(simplePendulum,
#                                          ystar = c(0, 0),
#                                          parameters = 5)
#  simplePendulum.stability.2 <- stability(simplePendulum,
#                                          ystar = c(pi, 0),
#                                          parameters = 5)
#  simplePendulum.manifolds   <- drawManifolds(simplePendulum,
#                                              y0 = c(pi, 0),
#                                              parameters = 5)

## ---- eval = F-----------------------------------------------------------
#  vanDerPol.stability.1 <- stability(vanDerPol, ystar = c(0, + 0),
#                                     parameters = 3)
#  vanDerPol.stability.2 <- stability(vanDerPol, ystar = c(0, + 0),
#                                     parameters = 1)

## ---- eval = F-----------------------------------------------------------
#  vanDerPol.flowField  <- flowField(vanDerPol, xlim = c(-5, 5),
#                                    ylim = c(-5, 5),
#                                    parameters = 3, add = FALSE)
#  grid()
#  vanDerPol.nullclines <- nullclines(vanDerPol, xlim = c(-5, 5),
#                                     ylim = c(-5, 5),
#                                     parameters = 3,
#                                     points = 500)
#  y0                   <- matrix(c(2, 0, 0, 2, 0.5, 0.5),
#                                 nrow = 3, ncol = 2,
#                                 byrow = TRUE)
#  vanDerPol.trajectory <- trajectory(vanDerPol, y0 = y0,
#                                     tlim = c(0, 10),
#                                     parameters = 3)


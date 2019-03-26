context("Test of ODEsobol.ODEnetwork() (and plotting)")

# Example of low frequency oscillations (LFO):
masses <- c(1, 1)
dampers <- diag(c(1, 1))
springs <- diag(c(1, 1))
springs[1, 2] <- 1
distances <- diag(c(0, 2))
distances[1, 2] <- 1
lfonet <- ODEnetwork(masses, dampers, springs, 
                     cartesian = TRUE, distances = distances)
lfonet <- setState(lfonet, c(0.5, 1), c(0, 0))
LFObinf <- rep(0.001, 3)
LFObsup <- c(6, 6, 3)
LFOtimes1 <- seq(0.1, 20, by = 5)
LFOtimes2 <- 10

# Martinez:
set.seed(2015)
LFOres1 <- suppressWarnings(
  ODEsobol(mod = lfonet,
           pars = c("k.1", "k.2", "k.1.2"),
           times = LFOtimes1,
           n = 10,
           rfuncs = c("runif", "rnorm", "rexp"),
           rargs = c("min = 0.001, max = 6",
                     "mean = 3, sd = 0.5",
                     "rate = 1 / 3"),
           sobol_method = "Martinez",
           ode_method = "adams",
           parallel_eval = FALSE,
           parallel_eval_ncores = NA)
)

# Only 1 point of time:
set.seed(2015)
LFOres2 <- suppressWarnings(
  ODEsobol(mod = lfonet,
           pars = c("k.1", "k.2", "k.1.2"),
           times = LFOtimes2,
           n = 10,
           rfuncs = c("runif", "rnorm", "rexp"),
           rargs = c("min = 0.001, max = 6",
                     "mean = 3, sd = 0.5",
                     "rate = 1 / 3"),
           sobol_method = "Martinez",
           ode_method = "adams",
           parallel_eval = FALSE,
           parallel_eval_ncores = NA)
)

# Only 1 parameter and 1 point of time:
set.seed(2015)
LFOres3 <- suppressWarnings(
  ODEsobol(mod = lfonet,
           pars = "k.1",
           times = LFOtimes2,
           n = 10,
           rfuncs = "runif",
           rargs = "min = 0.001, max = 6",
           sobol_method = "Martinez",
           ode_method = "adams",
           parallel_eval = FALSE,
           parallel_eval_ncores = NA)
)

# With parallelization:
set.seed(2015)
LFOres_parallel <- suppressWarnings(
  ODEsobol(mod = lfonet,
           pars = c("k.1", "k.2", "k.1.2"),
           times = LFOtimes1,
           n = 10,
           rfuncs = c("runif", "rnorm", "rexp"),
           rargs = c("min = 0.001, max = 6",
                     "mean = 3, sd = 0.5",
                     "rate = 1 / 3"),
           sobol_method = "Martinez",
           ode_method = "adams",
           parallel_eval = TRUE,
           parallel_eval_ncores = 2)
)

# Jansen:
set.seed(2015)
LFOres_jansen <- suppressWarnings(
  ODEsobol(mod = lfonet,
           pars = c("k.1", "k.2", "k.1.2"),
           times = LFOtimes1,
           n = 10,
           rfuncs = c("runif", "rnorm", "rexp"),
           rargs = c("min = 0.001, max = 6",
                     "mean = 3, sd = 0.5",
                     "rate = 1 / 3"),
           sobol_method = "Jansen",
           ode_method = "adams",
           parallel_eval = FALSE,
           parallel_eval_ncores = NA)
)

test_that("Result type is correct", {
  # Martinez:
  expect_true(is.list(LFOres1))
  expect_equal(class(LFOres1), "ODEsobol")
  expect_equal(attr(LFOres1, "sobol_method"), "Martinez")
  expect_equal(length(LFOres1), 4)
  expect_equal(names(LFOres1), c("x.1", "v.1", "x.2", "v.2"))
  expect_true(is.list(LFOres1$"x.1"))
  expect_true(is.list(LFOres1$"v.1"))
  expect_true(is.list(LFOres1$"x.2"))
  expect_true(is.list(LFOres1$"v.2"))
  expect_equal(length(LFOres1$"x.1"), 2)
  expect_equal(length(LFOres1$"v.1"), 2)
  expect_equal(length(LFOres1$"x.2"), 2)
  expect_equal(length(LFOres1$"v.2"), 2)
  expect_equal(dim(LFOres1$"x.1"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres1$"x.1"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres1$"v.1"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres1$"v.1"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres1$"x.2"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres1$"x.2"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres1$"v.2"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres1$"v.2"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  
  # Only 1 point of time:
  expect_true(is.list(LFOres2))
  expect_equal(class(LFOres2), "ODEsobol")
  expect_equal(attr(LFOres2, "sobol_method"), "Martinez")
  expect_equal(length(LFOres2), 4)
  expect_equal(names(LFOres2), c("x.1", "v.1", "x.2", "v.2"))
  expect_true(is.list(LFOres2$"x.1"))
  expect_true(is.list(LFOres2$"v.1"))
  expect_true(is.list(LFOres2$"x.2"))
  expect_true(is.list(LFOres2$"v.2"))
  expect_equal(length(LFOres2$"x.1"), 2)
  expect_equal(length(LFOres2$"v.1"), 2)
  expect_equal(length(LFOres2$"x.2"), 2)
  expect_equal(length(LFOres2$"v.2"), 2)
  expect_equal(dim(LFOres2$"x.1"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  expect_equal(dim(LFOres2$"x.1"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  expect_equal(dim(LFOres2$"v.1"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  expect_equal(dim(LFOres2$"v.1"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  expect_equal(dim(LFOres2$"x.2"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  expect_equal(dim(LFOres2$"x.2"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  expect_equal(dim(LFOres2$"v.2"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  expect_equal(dim(LFOres2$"v.2"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  
  # Only 1 parameter and 1 point of time:
  expect_true(is.list(LFOres3))
  expect_equal(class(LFOres3), "ODEsobol")
  expect_equal(attr(LFOres3, "sobol_method"), "Martinez")
  expect_equal(length(LFOres3), 4)
  expect_equal(names(LFOres3), c("x.1", "v.1", "x.2", "v.2"))
  expect_true(is.list(LFOres3$"x.1"))
  expect_true(is.list(LFOres3$"v.1"))
  expect_true(is.list(LFOres3$"x.2"))
  expect_true(is.list(LFOres3$"v.2"))
  expect_equal(length(LFOres3$"x.1"), 2)
  expect_equal(length(LFOres3$"v.1"), 2)
  expect_equal(length(LFOres3$"x.2"), 2)
  expect_equal(length(LFOres3$"v.2"), 2)
  expect_equal(dim(LFOres3$"x.1"$S), 
               c(1 + length(c("k.1")), length(LFOtimes2)))
  expect_equal(dim(LFOres3$"x.1"$T), 
               c(1 + length(c("k.1")), length(LFOtimes2)))
  expect_equal(dim(LFOres3$"v.1"$S), 
               c(1 + length(c("k.1")), length(LFOtimes2)))
  expect_equal(dim(LFOres3$"v.1"$T), 
               c(1 + length(c("k.1")), length(LFOtimes2)))
  expect_equal(dim(LFOres3$"x.2"$S), 
               c(1 + length(c("k.1")), length(LFOtimes2)))
  expect_equal(dim(LFOres3$"x.2"$T), 
               c(1 + length(c("k.1")), length(LFOtimes2)))
  expect_equal(dim(LFOres3$"v.2"$S), 
               c(1 + length(c("k.1")), length(LFOtimes2)))
  expect_equal(dim(LFOres3$"v.2"$T), 
               c(1 + length(c("k.1")), length(LFOtimes2)))
  
  # With parallelization:
  expect_equal(LFOres_parallel, LFOres1)
  
  # Jansen:
  expect_true(is.list(LFOres_jansen))
  expect_equal(class(LFOres_jansen), "ODEsobol")
  expect_equal(attr(LFOres_jansen, "sobol_method"), "Jansen")
  expect_equal(length(LFOres_jansen), 4)
  expect_equal(names(LFOres_jansen), c("x.1", "v.1", "x.2", "v.2"))
  expect_true(is.list(LFOres_jansen$"x.1"))
  expect_true(is.list(LFOres_jansen$"v.1"))
  expect_true(is.list(LFOres_jansen$"x.2"))
  expect_true(is.list(LFOres_jansen$"v.2"))
  expect_equal(length(LFOres_jansen$"x.1"), 2)
  expect_equal(length(LFOres_jansen$"v.1"), 2)
  expect_equal(length(LFOres_jansen$"x.2"), 2)
  expect_equal(length(LFOres_jansen$"v.2"), 2)
  expect_equal(dim(LFOres_jansen$"x.1"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres_jansen$"x.1"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres_jansen$"v.1"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres_jansen$"v.1"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres_jansen$"x.2"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres_jansen$"x.2"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres_jansen$"v.2"$S), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres_jansen$"v.2"$T), 
               c(1 + length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
})

test_that("Errors and warnings are thrown", {
  # n = 1:
  set.seed(2015)
  expect_error(ODEsobol(mod = lfonet,
                        pars = c("k.1", "k.2", "k.1.2"),
                        times = LFOtimes1,
                        n = 1,
                        rfuncs = c("runif", "rnorm", "rexp"),
                        rargs = c("min = 0.001, max = 6",
                                  "mean = 3, sd = 0.5",
                                  "rate = 1 / 3"),
                        sobol_method = "Martinez",
                        ode_method = "adams",
                        parallel_eval = FALSE,
                        parallel_eval_ncores = NA))
})

test_that("Plots are generated", {
  expect_true(plot(LFOres1))
  expect_true(plot(LFOres2))
  expect_true(plot(LFOres3))
  expect_true(plot(LFOres_parallel))
  expect_true(plot(LFOres_jansen))
  # Non-default arguments:
  expect_true(plot(LFOres1, state_plot = "x.2", main_title = "Hi!", 
                   legendPos = "topleft", type = "b"))
  # Custom colors:
  my_cols <- c("firebrick", "chartreuse3", "dodgerblue")
  expect_true(plot(LFOres1, state_plot = "x.2", colors_pars = my_cols))
  # Checking the passing of arguments:
  expect_true(plot(LFOres1, state_plot = "x.2", cex.axis = 2, cex = 4, 
                   main = "Small Title", cex.main = 0.5))
})

context("Test of ODEmorris.ODEnetwork() (and plotting)")

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

# Normal:
set.seed(2015)
LFOres1 <- ODEmorris(mod = lfonet,
                     pars = c("k.1", "k.2", "k.1.2"),
                     times = LFOtimes1,
                     binf = LFObinf,
                     bsup = LFObsup,
                     r = 4,
                     design =
                       list(type = "oat", levels = 100, grid.jump = 1),
                     scale = TRUE,
                     ode_method = "adams",
                     parallel_eval = FALSE,
                     parallel_eval_ncores = NA)

# Only 1 point of time:
set.seed(2015)
LFOres2 <- ODEmorris(mod = lfonet,
                     pars = c("k.1", "k.2", "k.1.2"),
                     times = LFOtimes2,
                     binf = LFObinf,
                     bsup = LFObsup,
                     r = 4,
                     design =
                       list(type = "oat", levels = 100, grid.jump = 1),
                     scale = TRUE,
                     ode_method = "adams",
                     parallel_eval = FALSE,
                     parallel_eval_ncores = NA)

# Only 1 parameter and 1 point of time:
set.seed(2015)
LFOres3 <- ODEmorris(mod = lfonet,
                     pars = "k.1",
                     times = LFOtimes2,
                     binf = LFObinf[1],
                     bsup = LFObsup[1],
                     r = 4,
                     design =
                       list(type = "oat", levels = 100, grid.jump = 1),
                     scale = TRUE,
                     ode_method = "adams",
                     parallel_eval = FALSE,
                     parallel_eval_ncores = NA)

# With parallelization:
set.seed(2015)
LFOres_parallel <- ODEmorris(mod = lfonet,
                             pars = c("k.1", "k.2", "k.1.2"),
                             times = LFOtimes1,
                             binf = LFObinf,
                             bsup = LFObsup,
                             r = 4,
                             design =
                               list(type = "oat", levels = 100, grid.jump = 1),
                             scale = TRUE,
                             ode_method = "adams",
                             parallel_eval = TRUE,
                             parallel_eval_ncores = 2)

# Simplex design:
set.seed(2015)
LFOres_simplex <- ODEmorris(mod = lfonet,
                            pars = c("k.1", "k.2", "k.1.2"),
                            times = LFOtimes1,
                            binf = LFObinf,
                            bsup = LFObsup,
                            r = 4,
                            design =
                              list(type = "simplex", scale.factor = 1 / 6),
                            scale = TRUE,
                            ode_method = "adams",
                            parallel_eval = FALSE,
                            parallel_eval_ncores = NA)

test_that("Result type is correct", {
  # Normal case:
  expect_true(is.list(LFOres1))
  expect_equal(class(LFOres1), "ODEmorris")
  expect_equal(length(LFOres1), 4)
  expect_equal(names(LFOres1), c("x.1", "v.1", "x.2", "v.2"))
  expect_true(is.matrix(LFOres1$"x.1"))
  expect_true(is.matrix(LFOres1$"v.1"))
  expect_true(is.matrix(LFOres1$"x.2"))
  expect_true(is.matrix(LFOres1$"v.2"))
  expect_equal(dim(LFOres1$"x.1"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres1$"v.1"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres1$"x.2"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres1$"v.2"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  
  # Only 1 point of time:
  expect_true(is.list(LFOres2))
  expect_equal(class(LFOres2), "ODEmorris")
  expect_equal(length(LFOres2), 4)
  expect_equal(names(LFOres2), c("x.1", "v.1", "x.2", "v.2"))
  expect_true(is.matrix(LFOres2$"x.1"))
  expect_true(is.matrix(LFOres2$"v.1"))
  expect_true(is.matrix(LFOres2$"x.2"))
  expect_true(is.matrix(LFOres2$"v.2"))
  expect_equal(dim(LFOres2$"x.1"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  expect_equal(dim(LFOres2$"v.1"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  expect_equal(dim(LFOres2$"x.2"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  expect_equal(dim(LFOres2$"v.2"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes2)))
  
  # Only 1 parameter and 1 point of time:
  expect_true(is.list(LFOres3))
  expect_equal(class(LFOres3), "ODEmorris")
  expect_equal(length(LFOres3), 4)
  expect_equal(names(LFOres3), c("x.1", "v.1", "x.2", "v.2"))
  expect_true(is.matrix(LFOres3$"x.1"))
  expect_true(is.matrix(LFOres3$"v.1"))
  expect_true(is.matrix(LFOres3$"x.2"))
  expect_true(is.matrix(LFOres3$"v.2"))
  expect_equal(dim(LFOres3$"x.1"), 
               c(1 + 3*length(c("k.1")), length(LFOtimes2)))
  expect_equal(dim(LFOres3$"v.1"), 
               c(1 + 3*length(c("k.1")), length(LFOtimes2)))
  expect_equal(dim(LFOres3$"x.2"), 
               c(1 + 3*length(c("k.1")), length(LFOtimes2)))
  expect_equal(dim(LFOres3$"v.2"), 
               c(1 + 3*length(c("k.1")), length(LFOtimes2)))
  
  # With parallelization:
  expect_equal(LFOres_parallel, LFOres1)
  
  # Simplex design:
  expect_true(is.list(LFOres_simplex))
  expect_equal(class(LFOres_simplex), "ODEmorris")
  expect_equal(length(LFOres_simplex), 4)
  expect_equal(names(LFOres_simplex), c("x.1", "v.1", "x.2", "v.2"))
  expect_true(is.matrix(LFOres_simplex$"x.1"))
  expect_true(is.matrix(LFOres_simplex$"v.1"))
  expect_true(is.matrix(LFOres_simplex$"x.2"))
  expect_true(is.matrix(LFOres_simplex$"v.2"))
  expect_equal(dim(LFOres_simplex$"x.1"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres_simplex$"v.1"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres_simplex$"x.2"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
  expect_equal(dim(LFOres_simplex$"v.2"), 
               c(1 + 3*length(c("k.1", "k.2", "k.1.2")), length(LFOtimes1)))
})

test_that("Errors and warnings are thrown", {
  # bsup < binf:
  set.seed(2015)
  expect_warning(LFOres_binf_bsup <- 
                   ODEmorris(mod = lfonet,
                             pars = c("k.1", "k.2", "k.1.2"),
                             times = LFOtimes1,
                             binf = c(6, rep(0.001, 2)),
                             bsup = c(0.001, 6, 3),
                             r = 4,
                             design =
                               list(type = "oat", levels = 100, grid.jump = 1),
                             scale = TRUE,
                             ode_method = "adams",
                             parallel_eval = FALSE,
                             parallel_eval_ncores = NA),
                 paste("At least one element of \"bsup\" was lower than the",
                       "corresponding element of \"binf\".", 
                       "Elements were swapped."))
  expect_equal(LFOres1, LFOres_binf_bsup)
  
  # r = 1:
  set.seed(2015)
  expect_warning(ODEmorris(mod = lfonet,
                           pars = c("k.1", "k.2", "k.1.2"),
                           times = LFOtimes1,
                           binf = LFObinf,
                           bsup = LFObsup,
                           r = 1,
                           design =
                             list(type = "oat", levels = 100, grid.jump = 1),
                           scale = TRUE,
                           ode_method = "adams",
                           parallel_eval = FALSE,
                           parallel_eval_ncores = NA),
                 "Calculation of sigma requires r >= 2.")
  
  # r = 0:
  set.seed(2015)
  expect_error(ODEmorris(mod = lfonet,
                         pars = c("k.1", "k.2", "k.1.2"),
                         times = LFOtimes1,
                         binf = LFObinf,
                         bsup = LFObsup,
                         r = 0,
                         design =
                           list(type = "oat", levels = 100, grid.jump = 1),
                         scale = TRUE,
                         ode_method = "adams",
                         parallel_eval = FALSE,
                         parallel_eval_ncores = NA))
})

test_that("Plots are generated", {
  expect_true(plot(LFOres1))
  expect_true(plot(LFOres2))
  expect_true(plot(LFOres3))
  expect_true(plot(LFOres_parallel))
  expect_true(plot(LFOres_simplex))
  # Trajectories:
  expect_true(plot(LFOres1, kind = "trajec"))
  expect_true(plot(LFOres2, kind = "trajec"))
  expect_true(plot(LFOres3, kind = "trajec"))
  expect_true(plot(LFOres_parallel, kind = "trajec"))
  expect_true(plot(LFOres_simplex, kind = "trajec"))
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

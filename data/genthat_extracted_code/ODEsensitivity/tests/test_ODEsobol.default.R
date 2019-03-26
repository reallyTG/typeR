context("Test of ODEsobol.default() (and plotting)")

# FHN-example:

FHNmod <- function(Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    
    dVoltage <- s * (Voltage - Voltage^3 / 3 + Current)
    dCurrent <- - 1 / s *(Voltage - a + b * Current)
    
    return(list(c(dVoltage, dCurrent)))
  })
}
FHNstate  <- c(Voltage = -1, Current = 1)
FHNtimes1 <- seq(0.1, 20, by = 5)
FHNtimes2 <- 10

# Martinez:
set.seed(2015)
FHNres1 <- suppressWarnings(
  ODEsobol(mod = FHNmod,
           pars = c("a", "b", "s"),
           state_init = FHNstate,
           times = FHNtimes1,
           n = 10,
           rfuncs = c("runif", "rnorm", "rexp"),
           rargs = c("min = 0.18, max = 0.22",
                     "mean = 0.2, sd = 0.2 / 3",
                     "rate = 1 / 3"),
           sobol_method = "Martinez",
           ode_method = "adams",
           parallel_eval = FALSE,
           parallel_eval_ncores = NA)
)

# Only 1 point of time:
set.seed(2015)
FHNres2 <- suppressWarnings(
  ODEsobol(mod = FHNmod,
           pars = c("a", "b", "s"),
           state_init = FHNstate,
           times = FHNtimes2,
           n = 10,
           rfuncs = c("runif", "rnorm", "rexp"),
           rargs = c("min = 0.18, max = 0.22",
                     "mean = 0.2, sd = 0.2 / 3",
                     "rate = 1 / 3"),
           sobol_method = "Martinez",
           ode_method = "adams",
           parallel_eval = FALSE,
           parallel_eval_ncores = NA)
)

# Only 1 parameter and 1 point of time:
FHNmod3 <- function(Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    
    dVoltage <- 3 * (Voltage - Voltage^3 / 3 + Current)
    dCurrent <- - 1 / 3 *(Voltage - a + 0.3 * Current)
    
    return(list(c(dVoltage, dCurrent)))
  })
}
set.seed(2015)
FHNres3 <- suppressWarnings(
  ODEsobol(mod = FHNmod3,
           pars = "a",
           state_init = FHNstate,
           times = FHNtimes2,
           n = 10,
           rfuncs = "runif",
           rargs = "min = 0.18, max = 0.22",
           sobol_method = "Martinez",
           ode_method = "adams",
           parallel_eval = FALSE,
           parallel_eval_ncores = NA)
)

# With parallelization:
set.seed(2015)
FHNres_parallel <- suppressWarnings(
  ODEsobol(mod = FHNmod,
           pars = c("a", "b", "s"),
           state_init = FHNstate,
           times = FHNtimes1,
           n = 10,
           rfuncs = c("runif", "rnorm", "rexp"),
           rargs = c("min = 0.18, max = 0.22",
                     "mean = 0.2, sd = 0.2 / 3",
                     "rate = 1 / 3"),
           sobol_method = "Martinez",
           ode_method = "adams",
           parallel_eval = TRUE,
           parallel_eval_ncores = 2)
)

# Jansen:
set.seed(2015)
FHNres_jansen <- suppressWarnings(
  ODEsobol(mod = FHNmod,
           pars = c("a", "b", "s"),
           state_init = FHNstate,
           times = FHNtimes1,
           n = 10,
           rfuncs = c("runif", "rnorm", "rexp"),
           rargs = c("min = 0.18, max = 0.22",
                     "mean = 0.2, sd = 0.2 / 3",
                     "rate = 1 / 3"),
           sobol_method = "Jansen",
           ode_method = "adams",
           parallel_eval = FALSE,
           parallel_eval_ncores = NA)
)

test_that("Result type is correct", {
  # Martinez:
  expect_true(is.list(FHNres1))
  expect_equal(class(FHNres1), "ODEsobol")
  expect_equal(attr(FHNres1, "sobol_method"), "Martinez")
  expect_equal(length(FHNres1), length(FHNstate))
  expect_equal(names(FHNres1), names(FHNstate))
  expect_true(is.list(FHNres1$Voltage))
  expect_equal(length(FHNres1$Voltage), 2)
  expect_equal(length(FHNres1$Current), 2)
  expect_true(is.list(FHNres1$Current))
  expect_true(is.matrix(FHNres1$Voltage$S))
  expect_true(is.matrix(FHNres1$Voltage$T))
  expect_true(is.matrix(FHNres1$Current$S))
  expect_true(is.matrix(FHNres1$Current$T))
  expect_equal(dim(FHNres1$Voltage$S), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes1)))
  expect_equal(dim(FHNres1$Voltage$T), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes1)))
  expect_equal(dim(FHNres1$Current$S), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes1)))
  expect_equal(dim(FHNres1$Current$T), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes1)))
  
  # Only 1 point of time:
  expect_true(is.list(FHNres2))
  expect_equal(class(FHNres2), "ODEsobol")
  expect_equal(attr(FHNres1, "sobol_method"), "Martinez")
  expect_equal(length(FHNres2), length(FHNstate))
  expect_equal(names(FHNres2), names(FHNstate))
  expect_true(is.list(FHNres2$Voltage))
  expect_equal(length(FHNres2$Voltage), 2)
  expect_equal(length(FHNres2$Current), 2)
  expect_true(is.list(FHNres2$Current))
  expect_true(is.matrix(FHNres2$Voltage$S))
  expect_true(is.matrix(FHNres2$Voltage$T))
  expect_true(is.matrix(FHNres2$Current$S))
  expect_true(is.matrix(FHNres2$Current$T))
  expect_equal(dim(FHNres2$Voltage$S), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes2)))
  expect_equal(dim(FHNres2$Voltage$T), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes2)))
  expect_equal(dim(FHNres2$Current$S), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes2)))
  expect_equal(dim(FHNres2$Current$T), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes2)))
  
  # Only 1 parameter and 1 point of time:
  expect_true(is.list(FHNres3))
  expect_equal(class(FHNres3), "ODEsobol")
  expect_equal(attr(FHNres1, "sobol_method"), "Martinez")
  expect_equal(length(FHNres3), length(FHNstate))
  expect_equal(names(FHNres3), names(FHNstate))
  expect_true(is.list(FHNres3$Voltage))
  expect_equal(length(FHNres3$Voltage), 2)
  expect_equal(length(FHNres3$Current), 2)
  expect_true(is.list(FHNres3$Current))
  expect_true(is.matrix(FHNres3$Voltage$S))
  expect_true(is.matrix(FHNres3$Voltage$T))
  expect_true(is.matrix(FHNres3$Current$S))
  expect_true(is.matrix(FHNres3$Current$T))
  expect_equal(dim(FHNres3$Voltage$S), 
               c(1 + length(c("a")), length(FHNtimes2)))
  expect_equal(dim(FHNres3$Voltage$T), 
               c(1 + length(c("a")), length(FHNtimes2)))
  expect_equal(dim(FHNres3$Current$S), 
               c(1 + length(c("a")), length(FHNtimes2)))
  expect_equal(dim(FHNres3$Current$T), 
               c(1 + length(c("a")), length(FHNtimes2)))
  
  # With parallelization:
  expect_equal(FHNres_parallel, FHNres1)
  
  # Jansen:
  expect_true(is.list(FHNres_jansen))
  expect_equal(class(FHNres_jansen), "ODEsobol")
  expect_equal(attr(FHNres_jansen, "sobol_method"), "Jansen")
  expect_equal(length(FHNres_jansen), length(FHNstate))
  expect_equal(names(FHNres_jansen), names(FHNstate))
  expect_true(is.list(FHNres_jansen$Voltage))
  expect_equal(length(FHNres_jansen$Voltage), 2)
  expect_equal(length(FHNres_jansen$Current), 2)
  expect_true(is.list(FHNres_jansen$Current))
  expect_true(is.matrix(FHNres_jansen$Voltage$S))
  expect_true(is.matrix(FHNres_jansen$Voltage$T))
  expect_true(is.matrix(FHNres_jansen$Current$S))
  expect_true(is.matrix(FHNres_jansen$Current$T))
  expect_equal(dim(FHNres_jansen$Voltage$S), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes1)))
  expect_equal(dim(FHNres_jansen$Voltage$T), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes1)))
  expect_equal(dim(FHNres_jansen$Current$S), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes1)))
  expect_equal(dim(FHNres_jansen$Current$T), 
               c(1 + length(c("a", "b", "s")), length(FHNtimes1)))
})

test_that("Errors and warnings are thrown", {
  # n = 1:
  set.seed(2015)
  expect_error(ODEsobol(mod = FHNmod,
                          pars = c("a", "b", "s"),
                          state_init = FHNstate,
                          times = FHNtimes1,
                          n = 1,
                          rfuncs = c("runif", "rnorm", "rexp"),
                          rargs = c("min = 0.18, max = 0.22",
                                    "mean = 0.2, sd = 0.2 / 3",
                                    "rate = 1 / 3"),
                          sobol_method = "Martinez",
                          ode_method = "adams",
                          parallel_eval = FALSE,
                          parallel_eval_ncores = NA))
})

test_that("Plots are generated", {
  expect_true(plot(FHNres1))
  expect_true(plot(FHNres2))
  expect_true(plot(FHNres3))
  expect_true(plot(FHNres_parallel))
  expect_true(plot(FHNres_jansen))
  # Non-default arguments:
  expect_true(plot(FHNres1, state_plot = "Current", main_title = "Hi!", 
                   legendPos = "topleft", type = "b"))
  # Custom colors:
  my_cols <- c("firebrick", "chartreuse3", "dodgerblue")
  expect_true(plot(FHNres1, state_plot = "Current", colors_pars = my_cols))
  # Checking the passing of arguments:
  expect_true(plot(FHNres1, state_plot = "Current", cex.axis = 2, cex = 4, 
                   main = "Small Title", cex.main = 0.5))
})

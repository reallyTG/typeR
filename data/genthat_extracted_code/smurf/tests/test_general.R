context("General tests for smurf")

test_that("Test GAM penalty weights", {
  
  formu2 <- rentm ~ p(area, pen = "gflasso", refcat = 3) + p(size, pen = "flasso") + p(year, pen = "lasso")
  
  expect_error(suppressWarnings(glmsmurf(formu2, family = gaussian(), data = rent,
                                         pen.weights = "gam.stand", lambda = 0.008914, 
                                         control = list(eps = 1e-5))),
               NA)
})


test_that("Test lambda1 and lambda2 penalty weights", {
  
  expect_error(suppressWarnings(glmsmurf(formu, family = gaussian(), data = rent,
                                         pen.weights = "glm.stand", lambda = 0.008914,
                                         lambda1 = 0.1, lambda2 = 0.2,
                                         control = list(eps = 1e-5))),
               NA)
})


test_that("Test low step size warning", {
  
  expect_warning(glmsmurf(formu, family = gaussian(), data = rent,
                                         pen.weights = "glm.stand", lambda = 0.008914,
                                         control = list(step = 1e-15, eps = 1e-5)),
                 paste0("The step size is below ", 1e-14, " and is no longer reduced. ",
                        "It might be better to start the algorithm with a larger step size."))
})


test_that("Test print", {
  
  expect_error(invisible(capture.output(glmsmurf(formu, family = gaussian(), data = rent,
                                                 pen.weights = "glm.stand", lambda = 0.008914,
                                                 control = list(print = TRUE, eps = 1e-5)))),
                 NA)
})

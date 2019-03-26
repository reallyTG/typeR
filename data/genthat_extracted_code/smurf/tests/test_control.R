context("Test glmsmurf.control function")


test_that("Test glmsmurf.control output", {
  
  # Check if no error
  expect_error(do.call("glmsmurf.control", list()), NA)
  
  control <- do.call("glmsmurf.control", list())
  
  # Check if list
  expect_true(is.list(control))
  
  # Check length
  expect_length(control,
                16L)
})


test_that("Test input for 'step' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(step = NULL)),
               NA)
  
  expect_error(do.call("glmsmurf.control", list(step = -1)),
               "'step' must be strictly larger than 0.",
               fixed = TRUE)

  expect_error(do.call("glmsmurf.control", list(step = 0)),
               "'step' must be strictly larger than 0.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(step = 1:2)),
               "'step' must be a numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(step = NA)),
               "'step' must be a numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(step = NaN)),
               "'step' must be a finite numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(step = Inf)),
               "'step' must be a finite numeric of length 1.",
               fixed = TRUE)
})


test_that("Test input for 'tau' in glmsmurf.control", {

  expect_error(do.call("glmsmurf.control", list(tau = -1)),
               "'tau' must be strictly between 0 and 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(tau = 0)),
               "'tau' must be strictly between 0 and 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(tau = 1)),
               "'tau' must be strictly between 0 and 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(tau = 1:2)),
               "'tau' must be a numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(tau = NA)),
               "'tau' must be a numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(tau = NaN)),
               "'tau' must be a finite numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(tau = Inf)),
               "'tau' must be a finite numeric of length 1.",
               fixed = TRUE)
})


test_that("Test input for 'epsilon' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(epsilon = -1)),
               "'epsilon' must be strictly larger than 0.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(epsilon = 0)),
               "'epsilon' must be strictly larger than 0.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(epsilon = 1:2)),
               "'epsilon' must be a numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(epsilon = NA)),
               "'epsilon' must be a numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(epsilon = NaN)),
               "'epsilon' must be a finite numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(epsilon = Inf)),
               "'epsilon' must be a finite numeric of length 1.",
               fixed = TRUE)
})


test_that("Test input for 'maxiter' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(maxiter = -1)),
               "'maxiter' must be at least 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(maxiter = 0)),
               "'maxiter' must be at least 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(maxiter = 0.5)),
               "'maxiter' must be at least 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(maxiter = 1)),
               NA)
  
  expect_error(do.call("glmsmurf.control", list(maxiter = 1:2)),
               "'maxiter' must be a numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(maxiter = NA)),
               "'maxiter' must be a numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(maxiter = NaN)),
               "'maxiter' must be a finite numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(maxiter = Inf)),
               "'maxiter' must be a finite numeric of length 1.",
               fixed = TRUE)
})


test_that("Test input for 'reest' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(reest = -1)),
               "'reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(reest = NULL)),
               "'reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(reest = c(0, 1))),
               "'reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(reest = NA)),
               "'reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(reest = NaN)),
               "'reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(reest = Inf)),
               "'reest' must be a logical of length 1.",
               fixed = TRUE)
})


test_that("Test input for 'k' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(k = -1)),
               "'k' must be a strictly positive integer.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(k = 0)),
               "'k' must be a strictly positive integer",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(k = 0.5)),
               "'k' must be a strictly positive integer",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(k = 1:2)),
               "'k' must be a strictly positive integer of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(k = NA)),
               "'k' must be a strictly positive integer of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(k = NaN)),
               "'k' must be a finite strictly positive integer of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(k = Inf)),
               "'k' must be a finite strictly positive integer of length 1.",
               fixed = TRUE)
})


test_that("Test input for 'oos.prop' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(oos.prop = -1)),
               "'oos.prop' must be a numeric strictly between 0 and 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(oos.prop = 0)),
               "'oos.prop' must be a numeric strictly between 0 and 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(oos.prop = 1)),
               "'oos.prop' must be a numeric strictly between 0 and 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(oos.prop = 1:2)),
               "'oos.prop' must be a numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(oos.prop = NA)),
               "'oos.prop' must be a numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(oos.prop = NaN)),
               "'oos.prop' must be a finite numeric of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(oos.prop = Inf)),
               "'oos.prop' must be a finite numeric of length 1.",
               fixed = TRUE)
  
  # Check if error when too few levels in training sample
  expect_error(glmsmurf(formu, family = gaussian(), data = rent, 
                        pen.weights = "glm.stand", lambda = "oos.mse",
                        control = list(lambda.length = 5, print = FALSE, oos.prop = 0.99)),
               paste0("Some levels are missing in the training sample. Please provide different indices in 'validation.index' in the control object",
                      " or use a different (smaller) value for 'oos.prop' in the control object."),
               fixed = TRUE)
})


test_that("Test input for 'validation.index' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(validation.index = NULL)),
               NA)
  
  expect_error(do.call("glmsmurf.control", list(validation.index = -1)),
               "All elements of 'validation.index' should be strictly positive integers.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(validation.index = 0)),
               "All elements of 'validation.index' should be strictly positive integers.",
               fixed = TRUE)

  expect_error(do.call("glmsmurf.control", list(validation.index = 0.5 + (0:1))),
               "All elements of 'validation.index' should be strictly positive integers.",
               fixed = TRUE)

  expect_error(do.call("glmsmurf.control", list(validation.index = NA)),
               "'validation.index' should be a numeric vector or NULL.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(validation.index = NaN)),
               "All elements of 'validation.index' should be strictly positive integers.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(validation.index = Inf)),
               "All elements of 'validation.index' should be strictly positive integers.",
               fixed = TRUE)
  
  # Check if error when too few levels in training sample
  expect_error(glmsmurf(formu, family = gaussian(), data = rent, 
                        pen.weights = "glm.stand", lambda = "oos.mse",
                        control = list(lambda.length = 5, print = FALSE, validation.index = 5:nrow(rent))),
               paste0("Some levels are missing in the training sample. Please provide different indices in 'validation.index' in the control object",
                      " or use a different (smaller) value for 'oos.prop' in the control object."),
               fixed = TRUE)
})


test_that("Test input for 'lambda.vector' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(lambda.vector = NULL)),
               NA)
  
  expect_error(do.call("glmsmurf.control", list(lambda.vector = -1)),
               "All elements of 'lambda.vector' should be strictly positive numbers.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.vector = 0)),
               "All elements of 'lambda.vector' should be strictly positive numbers.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.vector = numeric(0))),
               "'lambda.vector' must be a vector of strictly positive numbers or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.vector = NA)),
               "'lambda.vector' must be a vector of strictly positive numbers or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.vector = NaN)),
               "All elements of 'lambda.vector' should be strictly positive numbers.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.vector = Inf)),
               "All elements of 'lambda.vector' should be strictly positive numbers.",
               fixed = TRUE)
})


test_that("Test input for 'lambda.min' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(lambda.min = NULL)),
               NA)
  
  expect_error(do.call("glmsmurf.control", list(lambda.min = -1)),
               "'lambda.min' must be a strictly positive number of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.min = 0)),
               "'lambda.min' must be a strictly positive number of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.min = 1:2)),
               "'lambda.min' must be a strictly positive number of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.min = NA)),
               "'lambda.min' must be a strictly positive number of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.min = NaN)),
               "'lambda.min' must be a finite numeric of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.min = Inf)),
               "'lambda.min' must be a finite numeric of length 1 or 'NULL'.",
               fixed = TRUE)
})


test_that("Test input for 'lambda.max' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(lambda.max = NULL)),
               NA)
  
  expect_error(do.call("glmsmurf.control", list(lambda.max = -1)),
               "'lambda.max' must be a strictly positive number of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.max = 0)),
               "'lambda.max' must be a strictly positive number of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.max = 1:2)),
               "'lambda.max' must be a strictly positive number of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.max = NA)),
               "'lambda.max' must be a strictly positive number of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.max = NaN)),
               "'lambda.max' must be a finite numeric of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.max = Inf)),
               "'lambda.max' must be a finite numeric of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.max = 1, lambda.min = 2)),
               "'lambda.max' must be strictly larger than 'lambda.min'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.max = 1, lambda.min = 1)),
               "'lambda.max' must be strictly larger than 'lambda.min'.",
               fixed = TRUE)
})


test_that("Test input for 'lambda.length' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(lambda.length = -1)),
               "'lambda.length' must be a strictly positive integer of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.length = 0)),
               "'lambda.length' must be a strictly positive integer of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.length = 0.5)),
               "'lambda.length' must be a strictly positive integer of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.length = 1:2)),
               "'lambda.length' must be a strictly positive integer of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.length = NA)),
               "'lambda.length' must be a strictly positive integer of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.length = NaN)),
               "'lambda.length' must be a strictly positive integer of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.length = Inf)),
               "'lambda.length' must be a strictly positive integer of length 1.",
               fixed = TRUE)
})


test_that("Test input for 'lambda.reest' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(lambda.reest = -1)),
               "'lambda.reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.reest = NULL)),
               "'lambda.reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.reest = c(0, 1))),
               "'lambda.reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.reest = NA)),
               "'lambda.reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.reest = NaN)),
               "'lambda.reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(lambda.reest = Inf)),
               "'lambda.reest' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_false(do.call("glmsmurf.control", list(lambda.reest = TRUE, reest = FALSE))$lambda.reest)
})


test_that("Test input for 'ncores' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(ncores = NULL)),
               NA)
  
  expect_error(do.call("glmsmurf.control", list(ncores = -1)),
               "'ncores' must be a positive integer or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(ncores = 0)),
               "'ncores' must be a positive integer or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(ncores = 0.5)),
               "'ncores' must be a positive integer or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(ncores = 1:2)),
               "'ncores' must be a positive integer of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(ncores = NA)),
               "'ncores' must be a positive integer of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(ncores = NaN)),
               "'ncores' must be a positive integer of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(ncores = Inf)),
               "'ncores' must be a positive integer of length 1 or 'NULL'.",
               fixed = TRUE)
})


test_that("Test input for 'po.ncores' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(po.ncores = NULL)),
               NA)
  
  expect_error(do.call("glmsmurf.control", list(po.ncores = -1)),
               "'po.ncores' must be a positive integer or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(po.ncores = 0)),
               "'po.ncores' must be a positive integer or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(po.ncores = 0.5)),
               "'po.ncores' must be a positive integer or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(po.ncores = 1:2)),
               "'po.ncores' must be a positive integer of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(po.ncores = NA)),
               "'po.ncores' must be a positive integer of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(po.ncores = NaN)),
               "'po.ncores' must be a positive integer of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(po.ncores = Inf)),
               "'po.ncores' must be a positive integer of length 1 or 'NULL'.",
               fixed = TRUE)
  
  expect_warning(do.call("glmsmurf.control", list(po.ncores = 2, ncores = 2)),
                 "'po.ncores' is set to 1 since 'ncores' is already larger than 1.",
                 fixed = TRUE)
  
  expect_warning(do.call("glmsmurf.control", list(po.ncores = 2, ncores = 1)),
                 paste0("Setting 'po.ncores' larger than one is not advised unless at least one of the ",
                        "proximal operators takes long to compute."),
                 fixed = TRUE)
})


test_that("Test input for 'print' in glmsmurf.control", {
  
  expect_error(do.call("glmsmurf.control", list(print = -1)),
               "'print' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(print = NULL)),
               "'print' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(print = c(0, 1))),
               "'print' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(print = NA)),
               "'print' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(print = NaN)),
               "'print' must be a logical of length 1.",
               fixed = TRUE)
  
  expect_error(do.call("glmsmurf.control", list(print = Inf)),
               "'print' must be a logical of length 1.",
               fixed = TRUE)
})
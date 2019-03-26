context("Test input for glmsmurf function")


test_that("Test input for family", {

  expect_error(glmsmurf(formu, data = rent, family = "Pareto"),
               "object 'Pareto' of mode 'function' was not found",
               fixed = TRUE)
})


test_that("Test input for weights", {
  
  # Check if error for length
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), weights = 1),
               paste0("'weights' must be a numeric vector of length ", nrow(rent), " or NULL."),
               fixed = TRUE)
  
  # Check if error for length
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), weights = 1:10),
               paste0("'weights' must be a numeric vector of length ", nrow(rent), " or NULL."),
               fixed = TRUE)
  
  # Check if error for numeric vector
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), weights = rep("a", nrow(rent))),
               "'weights' must be a numeric vector or NULL.",
               fixed = TRUE)
  
  # Check if error for non-numerics
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), weights = NA),
               "'weights' must be a numeric vector or NULL.",
               fixed = TRUE)
  
  # Check if error for NaN
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), weights = NaN),
               "'weights' must be a vector of finite numbers.",
               fixed = TRUE)
  
  # Check if error for infinite numbers
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), weights = Inf),
               "'weights' must be a vector of finite numbers.",
               fixed = TRUE)
  
  # Check default
  n <- 10
  expect_equal(.check_input_weights(n = n),
               rep(1, n))
})


test_that("Test input for start", {
  
  # Check if error for length
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), start = 1),
               "'start' must be a numeric vector of length 63 or NULL.",
               fixed = TRUE)
  
  # Check if error for length
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), start = 1:10),
               "'start' must be a numeric vector of length 63 or NULL.",
               fixed = TRUE)
  
  # Check if error for numeric vector
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), start = rep("a", 63L)),
               "'start' must be a numeric vector or NULL.",
               fixed = TRUE)
  
  # Check if error for non-numerics
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), start = NA),
               "'start' must be a numeric vector or NULL.",
               fixed = TRUE)
  
  # Check if error for NaN
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), start = NaN),
               "'start' must be a vector of finite numbers.",
               fixed = TRUE)
  
  # Check if error for infinite numbers
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), start = Inf),
               "'start' must be a vector of finite numbers.",
               fixed = TRUE)
  
  # Check default
  expect_equal(.check_input_start(y = munich.fit$y, weights = munich.fit$weights,
                                  family = munich.fit$family, n = nrow(rent), 
                                  p = length(coef(munich.fit)) - 1, inter = TRUE),
               c(munich.fit$family$linkfun(weighted.mean(munich.fit$y, w = munich.fit$weights)), 
                 rep(0, length(coef(munich.fit)) - 1)))
})


test_that("No offset in formula", {
  rent2 <- rent
  rent2$of <- runif(nrow(rent2))
  formu2 <- rentm ~ p(area) + offset(of)
  
  expect_error(glmsmurf(formu2, data = rent2, family = gaussian()),
               "No offset(s) can be given in the formula. Please use the 'offset' argument to specify the offset.",
               fixed = TRUE)
})


test_that("Test input for offset", {
  
  # Check if error for length
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), offset = 1),
               paste0("'offset' must be a numeric vector of length ", nrow(rent), " or NULL."),
               fixed = TRUE)
  
  # Check if error for length
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), offset = 1:10),
               paste0("'offset' must be a numeric vector of length ", nrow(rent), " or NULL."),
               fixed = TRUE)
  
  # Check if error for numeric vector
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), offset = rep("a", nrow(rent))),
               "'offset' must be a numeric vector or NULL.",
               fixed = TRUE)
  
  # Check if error for non-numerics
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), offset = NA),
               "'offset' must be a numeric vector or NULL.",
               fixed = TRUE)
  
  # Check if error for NaN
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), offset = NaN),
               "'offset' must be a vector of finite numbers.",
               fixed = TRUE)
  
  # Check if error for infinite numbers
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), offset = Inf),
               "'offset' must be a vector of finite numbers.",
               fixed = TRUE)
  
  # Check default
  n <- 10
  expect_equal(.check_input_offset(n = n),
               rep(0, n))
})


test_that("Test input for lambda", {

  # Check if error for length
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda = 1:10),
               "'lambda' must be a numeric of length 1.",
               fixed = TRUE)

  # Check if error for numeric vector
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda = "a"),
               paste0("'lambda' must be a numeric, NULL, or one of 'cv.dev', 'cv.mse', 'cv.dss',",
                      " 'cv1se.dev', 'cv1se.mse', 'cv1se.dss', 'is.aic', 'is.bic', 'is.gcv',",
                      " 'oos.dev', 'oos.mse' or 'oos.dss'."),
               fixed = TRUE)

  # Check if error for non-numerics
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda = NA),
               "'lambda' must be numeric.",
               fixed = TRUE)

  # Check if error for NaN
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda = NaN),
               "'lambda' must be a finite number.",
               fixed = TRUE)

  # Check if error for infinite numbers
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda = Inf),
               "'lambda' must be a finite number.",
               fixed = TRUE)
  
  # Check default
  expect_equal(.check_input_lambda(),
               "cv1se.dev")
})


test_that("Test input for lambda1", {
  
  # Check if error for length
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda1 = 1:10),
               "'lambda1' must be a numeric of length 1.",
               fixed = TRUE)
  
  # Check if error for numeric vector
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda1 = "a"),
               paste0("'lambda1' must be numeric."),
               fixed = TRUE)
  
  # Check if error for non-numerics
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda1 = NA),
               "'lambda1' must be numeric.",
               fixed = TRUE)
  
  # Check if error for NaN
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda1 = NaN),
               "'lambda1' must be a finite number.",
               fixed = TRUE)
  
  # Check if error for infinite numbers
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda1 = Inf),
               "'lambda1' must be a finite number.",
               fixed = TRUE)
})


test_that("Test input for lambda2", {
  
  # Check if error for length
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda2 = 1:10),
               "'lambda2' must be a numeric of length 1.",
               fixed = TRUE)
  
  # Check if error for numeric vector
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda2 = "a"),
               paste0("'lambda2' must be numeric."),
               fixed = TRUE)
  
  # Check if error for non-numerics
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda2 = NA),
               "'lambda2' must be numeric.",
               fixed = TRUE)
  
  # Check if error for NaN
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda2 = NaN),
               "'lambda2' must be a finite number.",
               fixed = TRUE)
  
  # Check if error for infinite numbers
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), lambda2 = Inf),
               "'lambda2' must be a finite number.",
               fixed = TRUE)
})


test_that("Test input for penalty weights", {
  
  # Check if error for list
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), pen.weights = 1:10),
               "'pen.weights' must be a list of numeric vectors.",
               fixed = TRUE)
  
  # Check if error for numeric vector
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), pen.weights = "a"),
               paste0("'pen.weights' must be a list of numerics, NULL,",
                      " or one of 'eq', 'stand', 'glm', 'glm.stand', 'gam' or 'gam.stand'."),
               fixed = TRUE)
  
  L <- munich.fit$n.par.cov

  # Check if error for non-numerics
  L[[1]] <- c(1, NA)
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), pen.weights = L),
               "'pen.weights' must be a list of finite numeric vectors.",
               fixed = TRUE)
  
  # Check if error for NaN
  L[[1]] <- c(1, NaN)
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), pen.weights = L),
               "'pen.weights' must be a list of finite numeric vectors.",
               fixed = TRUE)
  
  # Check if error for infinite numbers
  L[[1]] <- c(1, Inf)
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), pen.weights = L),
               "'pen.weights' must be a list of finite numeric vectors.",
               fixed = TRUE)
  
  # Check if error for length
  L <- munich.fit$n.par.cov[-1]
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), pen.weights = L),
               "'pen.weights' must be a list of length 11.",
               fixed = TRUE)
  
  # Check if error for lengths of elements
  L <- suppressWarnings(glmsmurf(formu, data = rent, family = gaussian(), pen.weights.return = TRUE, 
                                 pen.weights = "stand", lambda = 10, control = list(maxiter = 1))$pen.weights)
  L2 <- L
  
  # One wrong length
  L$area <- L$area[-1]
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), pen.weights = L),
               "Element 'area' of 'pen.weights' has the wrong length.",
               fixed = TRUE)
  
  # Two wrong lengths
  L$year <- L$year[-2]
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), pen.weights = L),
               "Elements 'area', 'year' of 'pen.weights' have the wrong length.",
               fixed = TRUE)
  
  # Check if error for names of elements
  # One wrong name
  names(L2)[2] <- "b"
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), pen.weights = L2, lambda = 10),
               "Element 'b' of 'pen.weights' should have name 'area'.",
               fixed = TRUE)
  
  # Two wrong names
  names(L2)[3] <- "c"
  expect_error(glmsmurf(formu, data = rent, family = gaussian(), pen.weights = L2, lambda = 10),
               "Elements 'b', 'c' of 'pen.weights' should have names 'area', 'year', respectively.",
               fixed = TRUE)
})



test_that("Test input for adjacency matrices", {
  
  formu2 <- rentm ~ p(area, pen = "ggflasso")
  formu3 <- rentm ~ p(area, pen = "ggflasso") + p(year, pen = "ggflasso")
  
  # Check that no error when single adjacency matrix not in a list
  expect_error(glmsmurf(formu2, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                      adj.matrix = munich_adj, control = list(maxiter = 1)), NA)


  # Check for error since no list
  expect_error(glmsmurf(formu3, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = munich_adj, control = list(maxiter = 1)), 
               "'adj.matrix' needs to be a named list or NULL.", fixed = TRUE)
  
  # Check for error since wrong list length
  expect_error(glmsmurf(formu3, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = list(area = munich_adj), control = list(maxiter = 1)), 
               paste0("The number of elements of 'adj.matrix' needs to be the same as the number of predictors that",
                      " is penalized using the Graph-Guided Fused Lasso, i.e. 2."), fixed = TRUE)
  
  
  # Check for correct name of list
  expect_error(glmsmurf(formu2, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = list(year = munich_adj), control = list(maxiter = 1)), 
               "Element 1 of 'adj.matrix' needs to have name 'area'.", fixed = TRUE)
  
  # Check for correct list names
  expect_error(glmsmurf(formu3, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = list(area = munich_adj, b = munich_adj), control = list(maxiter = 1)), 
               "Element 2 of 'adj.matrix' needs to have name 'year'.", fixed = TRUE)
  
  
  # Check if error for number of levels
  expect_error(glmsmurf(formu3, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = list(area = munich_adj, year = munich_adj), control = list(maxiter = 1)), 
               paste0("Element 2 of 'adj.matrix' needs to be a square matrix with 10",
                      " rows (the number of levels of the corresponding predictor)."), fixed = TRUE)
  
  
  # Check if error for matrix
  expect_error(glmsmurf(formu2, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = 1:10, control = list(maxiter = 1)), 
               "A numeric matrix or element of class Matrix was expected in element 1 of 'adj.matrix'.", fixed = TRUE)

  
  # Check if error for matrix since wrong rownames
  rownames(munich_adj) <- 0:24
  expect_error(glmsmurf(formu2, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = munich_adj, control = list(maxiter = 1)), 
               paste0("The rownames of element 1 of 'adj.matrix' are not the same as the level names",
                      " of the corresponding predictor. Note that the order of the names is also important."), fixed = TRUE)
  
  # Check if error for matrix since wrong rownames
  rownames(munich_adj) <- 25:1
  expect_error(glmsmurf(formu2, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = munich_adj, control = list(maxiter = 1)), 
               paste0("The rownames of element 1 of 'adj.matrix' are not the same as the level names",
                      " of the corresponding predictor. Note that the order of the names is also important."), fixed = TRUE)
  
  
  # No adjacency matrix is provided
  expect_error(glmsmurf(formu2, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        control = list(maxiter = 1)), 
               paste0("The number of elements of 'adj.matrix' needs to be the same as the number of predictors that",
                      " is penalized using the Graph-Guided Fused Lasso, i.e. 1."), fixed = TRUE)
  
  
  # Non-symmetric adjacency matrix
  rownames(munich_adj) <- 1:25
  munich_adj2 <- munich_adj_orig
  munich_adj2[1, 10] <- 1
  expect_error(glmsmurf(formu2, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = munich_adj2), 
               "An adjacency matrix needs to be symmetric.")
  
  
  # No zero-one adjacency matrix
  munich_adj2 <- munich_adj
  munich_adj2[1, 2] <- 2; munich_adj2[2, 1] <- 2
  expect_error(glmsmurf(formu2, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = munich_adj2), 
               "All elements of an adjacency matrix need to be zero or one.")
  
  
  # No rownames for adjacency matrix
  rownames(munich_adj) <- NULL
  expect_error(glmsmurf(formu2, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = munich_adj), 
               paste0("The rownames of element 1 of 'adj.matrix' are not the same as the level names",
                      " of the corresponding predictor. Note that the order of the names is also important."), fixed = TRUE)
 
  # No colnames for adjacency matrix
  rownames(munich_adj) <- 1:25
  colnames(munich_adj) <- NULL
  expect_error(glmsmurf(formu2, data = rent, lambda = 10, family = gaussian(), pen.weights = "stand",
                        adj.matrix = munich_adj), 
               paste0("An adjacency matrix needs to be symmetric (including row and column names)."), fixed = TRUE)
  
  })  
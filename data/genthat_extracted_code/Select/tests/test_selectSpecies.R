library(Select)
context("Input checks")

test_that("t2c format",{
  t2c <- cbind(t1 = runif(15), t2 = runif(15))
  constraints = c(0.2,0.6)
  t2d <- cbind(t1 = runif(15), t2 = runif(15))
  row.names(t2d) <- row.names(t2c) <- letters[1:15]

  # t2c is not numeric
  t2c_err <- t2c
  t2c_err[1,1] <- "A"
  expect_error(selectSpecies(t2c_err, constraints, t2d, obj = "Q", phi = 0.3, euclid = F, capd = F), "object \"t2c\" is not a numerical matrix")

  # t2c is not a matrix
  t2c_err <- runif(15)
  expect_error(selectSpecies(t2c_err, constraints, t2d, obj = "Q", phi = 0.3, euclid = F, capd = F), "object \"t2c\" is not a numerical matrix")
})

test_that("t2d format",{
  t2c <- cbind(t1 = runif(15), t2 = runif(15))
  constraints = c(0.2,0.6)
  t2d <- cbind(t1 = runif(15), t2 = runif(15))
  row.names(t2d) <- row.names(t2c) <- letters[1:15]

  # t2d is not numeric
  t2d_err <- t2d
  t2d_err[1,1] <- "A"
  expect_error(selectSpecies(t2c, constraints, t2d_err, obj = "Q", phi = 0.3, euclid = F, capd = F), "object \"t2d\" must be a numerical trait matrix or a \"dist\" matrix")

  # t2d is not a matrix
  t2d_err <- runif(15)
  expect_error(selectSpecies(t2c, constraints, t2d_err, obj = "Q", phi = 0.3, euclid = F, capd = F), "object \"t2d\" must be a numerical trait matrix or a \"dist\" matrix")

    # t2d contains NA
  t2d_err <- dist(t2d)
  t2d_err[1]<-NA
  expect_error(selectSpecies(t2c, constraints, t2d_err, obj = "Q", phi = 0.3, euclid = F, capd = F), "Distance matrix \"t2d\" contains NA")

  })

test_that("constrain format",{
  t2c <- cbind(t1 = runif(15), t2 = runif(15))
  constraints = c(0.2,0.6)
  t2d <- cbind(t1 = runif(15), t2 = runif(15))
  row.names(t2d) <- row.names(t2c) <- letters[1:15]

  # t2d is not numeric
  constraints_err <- c("E", 0.1)
  expect_error(selectSpecies(t2c, constraints_err, t2d, obj = "Q", phi = 0.3, euclid = F, capd = F), "Trait constraint must all be numerical non-missing values.")
  constraints_err <- c(NA, 0.1)
  expect_error(selectSpecies(t2c, constraints_err, t2d, obj = "Q", phi = 0.3, euclid = F, capd = F), "Trait constraint must all be numerical non-missing values.")

})

test_that("phi format",{
  t2c <- cbind(t1 = runif(15), t2 = runif(15))
  constraints = c(0.2,0.6)
  t2d <- cbind(t1 = runif(15), t2 = runif(15))
  row.names(t2d) <- row.names(t2c) <- letters[1:15]

  # t2d is not numeric
  phi_err <-2
  expect_error(selectSpecies(t2c, constraints_err, t2d, obj = "Q", phi = phi_err, euclid = F, capd = F), "phi must be between 0 and 1")
  phi_err <--1
  expect_error(selectSpecies(t2c, constraints_err, t2d, obj = "Q", phi = phi_err, euclid = F, capd = F), "phi must be between 0 and 1")
  phi_err <-NA
  expect_error(selectSpecies(t2c, constraints_err, t2d, obj = "Q", phi = phi_err, euclid = F, capd = F), "phi must be between 0 and 1")
  phi_err <- "A"
  expect_error(selectSpecies(t2c, constraints_err, t2d, obj = "Q", phi = phi_err, euclid = F, capd = F), "phi must be between 0 and 1")
})

test_that("t2c and constrain matching",{
  t2c <- cbind(t1 = runif(15), t2 = runif(15))
  constraints = c(0.2,0.6)
  t2d <- cbind(t1 = runif(15), t2 = runif(15))
  row.names(t2d) <- row.names(t2c) <- letters[1:15]

  # Dimensions don't match
  constraints_err <- constraints[-1]
  expect_error(selectSpecies(t2c, constraints_err, t2d, obj = "Q", phi = 0.3, euclid = F, capd = F))

  # Constraints are out of range
  constraints_err <- c(5,0.2)
  expect_error(selectSpecies(t2c, constraints_err, t2d, phi = 0.3, euclid = F, capd = F))

  # Constraints are out of range
  constraints_err <- c(0.6,-0.2)
  expect_error(selectSpecies(t2c, constraints_err,t2d, obj = "Q", t2d, phi = 0.3, euclid = F, capd = F))
})

test_that("t2d and t2c matching",{
  t2c <- cbind(t1 = runif(15), t2 = runif(15))
  constraints = c(0.2,0.6)
  t2d <- cbind(t1 = runif(15), t2 = runif(15))
  row.names(t2d) <- row.names(t2c) <- letters[1:15]

  # Dimensions don't match
  t2d_err <- t2d[-1,]
  expect_error(selectSpecies(t2c, constraints, t2d_err, obj = "Q", phi = 0.3, euclid = F, capd = F))

  # Species names don't match
  t2d_err <- t2d
  row.names(t2d_err) <- rev(row.names(t2d_err))
  expect_error(selectSpecies(t2c, constraints, t2d_err, obj = "Q", phi = 0.3, euclid = F, capd = F))

  # With a distance matrix
  t2c <- cbind(t1 = runif(15), t2 = runif(15))
  constraints = c(0.2,0.6)
  t2d <- cbind(t1 = runif(15), t2 = runif(15))
  row.names(t2d) <- row.names(t2c) <- letters[1:15]

  # Dimensions don't match
  t2d_err <- t2d[-1,]
  expect_error(selectSpecies(t2c, constraints, dist(t2d_err), obj = "Q", phi = 0.3, euclid = F, capd = F))

  # Species names don't match
  t2d_err <- t2d
  row.names(t2d_err) <- rev(row.names(t2d_err))
  expect_error(selectSpecies(t2c, constraints, dist(t2d_err), obj = "Q", phi = 0.3, euclid = F, capd = F))
})

test_that("Test result",{
  t2c <- cbind(t1 = c(0,0.5,1))
  constraints = 0.5
  t2d <- t2c
  expect <- as.matrix(rep(1/3,3))
  row.names(t2d) <- row.names(t2c) <- row.names(expect) <- letters[1:3]

  # Test H function
  expect_equal(selectSpecies(t2c, constraints, t2d, obj = "H", phi = 0.5, euclid = F, capd = F)$prob, expect, tolerance = 0.001)
  expect_equal(as.numeric(selectSpecies(t2c, constraints, t2d, obj = "H", phi = 0.5, euclid = F, capd = F)$H), log(3), tolerance = 0.001)
  expect_equal(as.numeric(selectSpecies(t2c, constraints, t2d, obj = "H", phi = 0.5, euclid = F, capd = F)$Q), 1/4.5, tolerance = 0.001)
  expect_equal(as.numeric(selectSpecies(t2c, constraints, t2d, obj = "H", phi = 0.5, euclid = F, capd = F)$cwm_t2c), 0.5, tolerance = 0.001)

  # Test Q function
  expect <- as.matrix(c(0.5,0,0.5))
  row.names(expect) <- letters[1:3]
  expect_equal(selectSpecies(t2c, constraints, t2d, obj = "Q", phi = 0.5, euclid = F, capd = F)$prob, expect, tolerance = 0.001)
  expect_equal(as.numeric(selectSpecies(t2c, constraints, t2d, obj = "Q", phi = 0.5, euclid = F, capd = F)$H), log(2), tolerance = 0.001)
  expect_equal(as.numeric(selectSpecies(t2c, constraints, t2d, obj = "Q", phi = 0.5, euclid = F, capd = F)$Q), 0.25, tolerance = 0.001)
  expect_equal(as.numeric(selectSpecies(t2c, constraints, t2d, obj = "Q", phi = 0.5, euclid = F, capd = F)$cwm_t2c), 0.5, tolerance = 0.001)
})

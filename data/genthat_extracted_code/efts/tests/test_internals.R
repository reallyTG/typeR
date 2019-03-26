context("Functions used internally to process arrays")

# library(testthat)
# library(devtools)
# load_all('c:/src/github_jm/efts')

test_that("Dimensional reduction and reordering by dim name", {
  x <- array(1:48, c(1,2,1,24))
  dim_names(x) <- letters[1:4]

  subset_dim_names <- letters[c(2,4)]
  y <- reduce_dimensions(x,subset_dim_names)
  expect_equal(dim(y), c(2, 24))
  expect_equal(dim_names(y), subset_dim_names)
  # If we do not specify the subset, the default is to reduce 
  # dimensions and keep non-degenerate in the incoming dim order
  y <- reduce_dimensions(x)
  expect_equal(dim(y), c(2, 24))
  expect_equal(dim_names(y), subset_dim_names)

  subset_dim_names <- letters[c(4,2)]
  y <- reduce_dimensions(x,subset_dim_names)
  expect_equal(dim(y), c(24, 2))
  expect_equal(dim_names(y), subset_dim_names)

  x <- array(1:24, c(1,1,1,24))
  dim_names(x) <- letters[1:4]
  subset_dim_names <- letters[c(2,4)]
  y <- reduce_dimensions(x,subset_dim_names)
  # Because we specified letters[2] as a dim of interest, 
  # it is present in the output even if of size 1
  expect_equal(dim(y), c(1, 24))
  expect_equal(dim_names(y), subset_dim_names)

  subset_dim_names <- letters[c(4,2)]
  y <- reduce_dimensions(x,subset_dim_names)
  expect_equal(dim(y), c(24, 1))
  expect_equal(dim_names(y), subset_dim_names)


  # Testing incorrect dimensions specifications
  x <- array(1:48, c(1,2,1,24))
  expect_error(dim_names(x) <- letters[1:3])
  expect_error(dim_names(x) <- letters[1:5])
  expect_error(dim_names(x) <- letters[c(1,1,2,2)])
  dim_names(x) <- letters[1:4]

  subset_dim_names <- letters[c(2,4)]
  expect_error(reduce_dimensions(x, letters[c(1,4)]))
  expect_error(reduce_dimensions(x, letters[c(2,4,11)]))

})


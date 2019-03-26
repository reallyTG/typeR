testthat::context("Testing the cross-validation fold creator.")

testthat::test_that("create_folds full stratification correctly orders observations.",{
  time <- c(1,2,3,4,5,6,7,8,9,10)
  delta <- c(1,0,1,0,1,0,1,0,1,0)
  foldtype <- "fullstrat"

  expect_equal(create_folds(time, delta, 5, foldtype),
               list(c(2,1),c(4,3),c(6,5),c(8,7),c(10,9)))
  expect_equal(create_folds(time, delta, 2, foldtype),
               list(c(2,6,10,3,7),c(4,8,1,5,9)))
  expect_equal(create_folds(time, delta, 10,foldtype),
               list(2,4,6,8,10,1,3,5,7,9))

  delta <- sort(delta)

  expect_equal(create_folds(time, delta, 5, foldtype),
               list(c(1,6),c(2,7),c(3,8),c(4,9),c(5,10)))
  expect_equal(create_folds(time, delta, 2,foldtype),
               list(c(1,3,5,7,9),c(2,4,6,8,10)))
})

testthat::test_that("create_folds censor stratification correctly stratifies the number of censored observations.",{
  time <- c(1,2,3,4,5,6,7,8,9,10)
  delta <- c(1,0,1,0,1,0,1,0,1,0)
  foldtype <- "censorstrat"

  #Get the number of censored individuals in each fold.
  get_deltas <- function(folds, delta, time){
    return(sapply(folds, function(x) sum(!delta[match(x,time)])))
  }

  expect_equal(get_deltas(create_folds(time, delta, 5, foldtype), delta, time),
               c(1,1,1,1,1))
  expect_equal(get_deltas(create_folds(time, delta, 2, foldtype), delta, time),
               c(3,2))
  expect_equal(get_deltas(create_folds(time, delta, 3, foldtype), delta, time),
               c(2,2,1))
  expect_equal(get_deltas(create_folds(time, delta, 4, foldtype), delta, time),
               c(2,1,1,1))
  expect_equal(get_deltas(create_folds(time, delta, 10, foldtype), delta, time),
               c(1,1,1,1,1,0,0,0,0,0))

  time <- c(1,2,3,4,5)
  delta <- c(1,1,0,0,0)

  expect_equal(get_deltas(create_folds(time, delta, 3, foldtype), delta, time),
               c(1,1,1))
  expect_equal(get_deltas(create_folds(time, delta, 2, foldtype), delta, time),
               c(2,1))
  expect_equal(get_deltas(create_folds(time, delta, 1, foldtype), delta, time),
               c(3))
})


testthat::test_that("create_folds no stratification places an equal(ish) number of observations in each fold.",{
  time <- c(1,2,3,4,5,6,7,8,9,10)
  delta <- c(1,0,1,0,1,0,1,0,1,0)
  foldtype <- "random"

  get_sizes <- function(folds){
    return(sapply(folds, function(x) length(x)))
  }

  expect_equal(get_sizes(create_folds(time,delta,5,foldtype)),
               c(2,2,2,2,2))
  expect_equal(get_sizes(create_folds(time,delta,2,foldtype)),
               c(5,5))
  expect_equal(get_sizes(create_folds(time,delta,1,foldtype)),
               c(10))
  expect_equal(get_sizes(create_folds(time,delta,10,foldtype)),
               c(1,1,1,1,1,1,1,1,1,1))
})

testthat::test_that("create_folds catches incorrect argument format.",{
    expect_error(create_folds(c(1,2,3),c(0,0,1),0,"fullstrat"), "Number of folds must be greater than 0.")
    expect_error(create_folds(c(1,2,3),c(0,0,1),0,"banana"))
})

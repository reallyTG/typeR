context("rFractionalWishart")

test_that("rFractionalWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    rFractionalWishart(1, 4.99, 
                                       diag(1, 3))[,,1], 
                    diag(1, 3)
                  )
        )
      )
    ), 
    5)
})

## This is not a test of rFractionalWishart and fails intermittently
##test_that("rFractionalWishart produces Wishart Matrix", {
##  expect_equal(
##    round(
##      mean(
##        replicate(1000, 
##                  wishartTest(
##                    FractionalWishart(4.99, 
##                                    diag(1, 3)), 
##                    diag(1, 3)
##                  )
##        )
####      )
##    ), 
##    5)
##})

test_that("rFractionalWishart produces Wishart Matrix", {
  expect_true(class(FractionalWishart(4.99, diag(1, 3), 
                                    covariance = TRUE))[[1]] == "covariance")
})

test_that("rFractionalWishart produces Wishart Matrix", {
  expect_error(FractionalWishart(4.99, diag(1, 20)))
})

context("rNonsingularWishart")

test_that("rNonsingularWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    rNonsingularWishart(1, 5, 
                                     diag(1, 3))[,,1], 
                    diag(1, 3)
                  )
        )
      )
    ), 
    5)
})

test_that("rNonsingularWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    NonsingularWishart(5, 
                                    diag(1, 3)), 
                    diag(1, 3)
                  )
        )
      )
    ), 
    5)
})

test_that("rNonsingularWishart produces Wishart Matrix", {
  expect_true(class(NonsingularWishart(5, diag(1, 3), 
                                    covariance = TRUE))[[1]] == "covariance")
})

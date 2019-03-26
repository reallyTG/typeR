context("rSingularWishart")

test_that("rSingularWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    rSingularWishart(1, 5, 
                                     diag(1, 20))[,,1], 
                    diag(1, 20)
                  )
        )
      )
    ), 
    5)
})

test_that("rSingularWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    SingularWishart(5, 
                                    diag(1, 20)), 
                    diag(1, 20)
                  )
        )
      )
    ), 
    5)
})

test_that("rSingularWishart produces Wishart Matrix", {
  expect_true(class(SingularWishart(5, diag(1, 20), 
                                    covariance = TRUE))[[1]] == "covariance")
})

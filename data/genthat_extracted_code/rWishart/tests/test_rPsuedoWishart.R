context("rPsuedoWishart")

test_that("rPsuedoWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    rPsuedoWishart(1, 5, 
                                     diag(1, 20))[,,1], 
                    diag(1, 20)
                  )
        )
      )
    ), 
    5)
})

test_that("rPseudoWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    PsuedoWishart(5, 
                                    diag(1, 20)), 
                    diag(1, 20)
                  )
        )
      )
    ), 
    5)
})

test_that("rPsuedoWishart produces Wishart Matrix", {
  expect_true(class(PsuedoWishart(5, diag(1, 20), 
                                    covariance = TRUE))[[1]] == "covariance")
})

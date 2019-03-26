context("rWishart")

test_that("rWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    rWishart(1, 4.99, diag(1, 3))[,,1], 
                    diag(1, 3)
                  )
        )
      )
    ), 
    5)
})

test_that("rWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    rWishart(1, 5, diag(1, 3))[,,1], 
                    diag(1, 3)
                  )
        )
      )
    ), 
    5)
})

test_that("rWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    rWishart(1, 5, diag(1, 20))[,,1], 
                    diag(1, 20)
                  )
        )
      )
    ), 
    5)
})

rP <- rbind(cbind(diag(1, 20), 0), c(1, rep(0,20)))

test_that("rSingularWishart produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    rWishart(1, 5, rP)[,,1], 
                    rP
                  )
        )
      )
    ), 
    5)
})


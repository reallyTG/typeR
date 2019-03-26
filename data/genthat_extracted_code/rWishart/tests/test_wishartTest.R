context("wishartTest")

test_that("wishartTest produces Wishart Matrix", {
  expect_equal(
    round(
      mean(
        replicate(1000, 
                  wishartTest(
                    rWishart(1, 5, diag(1, 3))[,,1], 
                    diag(1, 3), vec = c(1, 0, 0)
                  )
        )
      )
    ), 
    5)
})


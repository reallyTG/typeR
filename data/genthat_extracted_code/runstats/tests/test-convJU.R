

context("Checking convJU")

test_that("Checking if the result of convJU has not changed" , {
  x <- sin(seq(0, 1, length.out = 1000) * 2 * pi * 6)
  y <- rep(1, 100)
  out <- convJU(x, y)
  expect_equal(c(-50.6734271998677, -35.6213786657441, -5.91171556152403e-14,
                 -1.8195930873155e-15, 35.6213786657442, 50.6734271998677),
               as.vector(summary(out)))
})


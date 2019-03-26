test_that("Test of Markovmoments", {
  a<- c( - 1, 1)
  A <- matrix(c(0.5, 0.5,
                0.6, 0.4  ), 2, 2)
  m <-  Markovmoments(a, A)
  expect_equal(length(a), length(m$"Stationary distribution"))
})

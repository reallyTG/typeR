
test_that("A valid output",{
  expect_length(.make_diag(c(1,2,3,4,5)),25)
  expect_equal(.make_diag(c(1,1,1)),diag(3))
})


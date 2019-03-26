# Output class
test_that("products function: output class is wrong", {
  expect_true(is.vector(products("2 A[c] + 3 B[c] => 5 D[c]")))
  expect_true(is.vector(products("2 5-A[c] + 3 B[c] <=> 5 3D[c]")))
})

# Output value
test_that("products function: output value is wrong", {
  expect_equal(products("2 A[c] + 3 B[c] => 5 D[c]"), c("D[c]"))
  expect_equal(products("2 5-A[c] + 3 B[c] <=> 5 3D[c]"),
               c("5-A[c]", "B[c]", "3D[c]"))
})

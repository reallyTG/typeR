# Output class
test_that("orphanProducts function: output class is wrong", {
  expect_true(is.vector(orphanProducts("2 A[c] + 3 B[c] => 5 D[c]")))
  expect_true(is.vector(orphanProducts("2 5-A[c] + 3 B[c] <=> 5 3D[c]")))
})

# Output value
test_that("orphanProducts function: output value is wrong", {
  expect_equal(orphanProducts("2 A[c] + 3 B[c] => 5 D[c]"), c("D[c]"))
  expect_equivalent(orphanProducts("2 5-A[c] + 3 B[c] <=> 5 3D[c]"),
                    c("3D[c]", "5-A[c]", "B[c]"))
})

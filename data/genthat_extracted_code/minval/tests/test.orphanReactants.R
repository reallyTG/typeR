# Output class
test_that("orphanReactants function: output class is wrong", {
  expect_true(is.vector(orphanReactants("2 A[c] + 3 B[c] => 5 D[c]")))
  expect_true(is.vector(orphanReactants("2 5-A[c] + 3 B[c] <=> 5 3D[c]")))
})

# Output value
test_that("orphanReactants function: output value is wrong", {
  expect_equal(orphanReactants("2 A[c] + 3 B[c] => 5 D[c]"), c("A[c]", "B[c]"))
  expect_equivalent(orphanReactants("2 5-A[c] + 3 B[c] <=> 5 3D[c]"),
                    c("3D[c]", "5-A[c]", "B[c]"))
})

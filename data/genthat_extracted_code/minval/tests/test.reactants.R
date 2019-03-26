# Output class
test_that("reactants function: output class is wrong", {
  expect_true(is.vector(reactants("2 A[c] + 3 B[c] => 5 D[c]")))
  expect_true(is.vector(reactants("2 5-A[c] + 3 B+[c] <=> 5 3D[c]")))
})

# Output value
test_that("reactants function: output value is wrong", {
  expect_equal(reactants("2 A[c] + 3 B[c] => 5 D[c]"), c("A[c]", "B[c]"))
  expect_equal(reactants("2 5-A[c] + 3 B[c] <=> 5 3D[c]"),
               c("5-A[c]", "B[c]", "3D[c]"))
})

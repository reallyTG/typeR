# Output Class
test_that("validateSyntax function: Output class is wrong", {
  expect_true(is.vector(validateSyntax(
    reactionList = c("4A[c] + 3 B[m] => 2.165557 C[e]", "A[c] + B[m] => C[e]")
  )))
})

# Output Value
test_that("validateSyntax function: Output value is wrong", {
  expect_true(validateSyntax(reactionList = "A[c] + B[m] => C[e]"))
  expect_true(validateSyntax(reactionList = "4A[c] + 3 B[m] => 2.165557 C[e]"))
  expect_false(suppressWarnings(validateSyntax(reactionList = "4A[c] + 3 3 B[m] => 2.165557 C[e]")))
})
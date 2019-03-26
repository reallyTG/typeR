# reactionType: Output class
test_that("reactionType function: output class is wrong", {
  expect_true(is.vector(reactionType("2 A[c] + 3 B[c] => 5 D[c]")))
  expect_true(is.vector(reactionType("2 5-A[c] + 3 B[c] <=> 5 3D[c]")))
})
# reactionType: Output value
test_that("products function: output value is wrong", {
  reactionList <-
    c(
      "A[c] <=>",
      "A[c] => B[m]",
      "A[c] + B[c] => C[c]",
      "A[c] + B[m] <=> C[c]",
      "A[c] + B[m] => C[m]",
      "A[c] + B[m] => C[c] + D[m]"
    )
  expect_equal(
    reactionType(reactionList = reactionList),
    c(
      "Exchange reaction",
      "Transport reaction",
      "Compartmentalized reaction",
      "Transport reaction",
      "Transport reaction",
      "Transport reaction"
    )
  )
})
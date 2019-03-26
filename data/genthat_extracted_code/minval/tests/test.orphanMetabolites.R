# Output class
test_that("orphanMetabolites function: output class is wrong", {
  expect_true(is.vector(
    orphanMetabolites(reactionList = "2 A[c] + 3 B[c] => 5 D[c]", actingAs = "product")
  ))
  expect_true(is.vector(
    orphanMetabolites(reactionList = "2 5-A[c] + 3 B[c] <=> 5 3D[c]", actingAs = "product")
  ))
  expect_true(is.vector(
    orphanMetabolites(reactionList = "2 A[c] + 3 B[c] => 5 D[c]", actingAs = "reactant")
  ))
  expect_true(is.vector(
    orphanMetabolites(reactionList = "2 5-A[c] + 3 B[c] <=> 5 3D[c]", actingAs = "reactant")
  ))
})

# Output value
test_that("orphanProducts function: output value is wrong", {
  expect_equal(
    orphanMetabolites(reactionList = "2 A[c] + 3 B[c] => 5 D[c]", actingAs = "product"),
    c("D[c]")
  )
  expect_equivalent(
    orphanMetabolites("2 5-A[c] + 3 B[c] <=> 5 3D[c]", actingAs = "product"),
    c("3D[c]", "5-A[c]", "B[c]")
  )
  expect_equal(
    orphanMetabolites(reactionList = "2 A[c] + 3 B[c] => 5 D[c]", actingAs = "reactant"),
    c("A[c]", "B[c]")
  )
  expect_equivalent(
    orphanMetabolites(reactionList = "2 5-A[c] + 3 B[c] <=> 5 3D[c]", actingAs = "reactant"),
    c("3D[c]", "5-A[c]", "B[c]")
  )
})

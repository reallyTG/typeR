# Output class
test_that("stoichiometricMatrix output class is wrong", {
  expect_true(is.matrix(stoichiometricMatrix("A[c] + B[c] => D[c]")))
})

# Output value
test_that("stoichiometricMatrix output value is wrong", {
  expect_equal(dim(stoichiometricMatrix(reactionList = "2 A[c] + 3 B[c] => 5 D[c]")), c(3, 1))
  expect_equal(as.numeric(stoichiometricMatrix(reactionList = "2 5-A[c] + 3 B+[c] => 5 3D[c]")), c(-2, -3, 5))
  expect_equal(as.numeric(stoichiometricMatrix(reactionList = "2 5-A[c] + 3 B+[c] => 5 3D[c] + 2 B+[c]")), c(-2, -1, 5))
  expect_equal(as.numeric(stoichiometricMatrix(reactionList = "2 5-A[c] + 3 B+[c] => 5 3D[c] + 5 B+[c]")), c(-2, 2, 5))
  expect_equal(as.numeric(stoichiometricMatrix(reactionList = "2 5-A[c] + 3 B+[c] => 5 3D[c] + 3 B+[c]")), c(-2, 0, 5))
  expect_equal(as.numeric(stoichiometricMatrix(reactionList = "2 5-A[c] + 3 B+[c] <=> 5 3D[c] + 2 B+[c]")), c(-2, -1, 5))
  expect_equal(as.numeric(stoichiometricMatrix(reactionList = "2 5-A[c] + 3 B+[c] <=> 5 3D[c] + 5 B+[c]")), c(-2, 2, 5))
  expect_equal(as.numeric(stoichiometricMatrix(reactionList = "2 5-A[c] + 3 B+[c] <=> 5 3D[c] + 3 B+[c]")), c(-2, 0, 5))
})
# Check output class
test_that("compartments function: the output class is wrong", {
  expect_true(is.vector(compartments(reactionList = "A[c]")))
  expect_true(is.vector(compartments(reactionList = "A[c]",uniques = TRUE)))
})

# Check values
test_that("compartments function: the output value is wrong", {
  expect_equal(compartments(reactionList = c("A[c]", "B[protein]A[m_pro]", "C[r]","2 5-A[c] + 3 B[c] <=> 5 3D[c] + B[c]")), c("c", "m_pro", "r"))
  expect_equal(compartments(reactionList = c("A[c]", "B[protein]A[m_pro]", "C[r]","2 5-A[c] + 3 B[c] <=> 5 3D[c] + B[c]"),uniques = FALSE), 
               c("c", "m_pro", "r","c","c","c","c"))
  
})

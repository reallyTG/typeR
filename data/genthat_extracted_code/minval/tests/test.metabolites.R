# Output class
test_that("metabolites function: the output class is wrong", {
  expect_true(is.vector(metabolites(
    reactionList = c(
      "A[c]",
      "B[protein]A[m_pro]",
      "C[r]",
      "2 5-A[c] + 3 B[c] <=> 5 3D[c] + B[c]"
    )
  )))
})

# Output value
test_that("metabolites function: the output value is wrong", {
  expect_equal(
    object = metabolites(
      reactionList = c(
        "A[c]",
        "B[protein]A[m_pro]",
        "C[r]",
        "2 5-A[c] + 3 B[c] <=> 5 3D[c] + B[c]"
      ),
      woCompartment = TRUE,uniques = FALSE
    ),
    expected = c("A", "B[protein]A", "C", "5-A", "B","3D","B")
  )
  expect_equal(
    object = metabolites(
      reactionList = c(
        "A[c]",
        "B[protein]A[m_pro]",
        "C[r]",
        "2 5-A[c] + 3 B[c] <=> 5 3D[c] + B[c]"
      ),
      woCompartment = TRUE,uniques = TRUE
    ),
    expected = c("A", "B[protein]A", "C", "5-A", "B","3D")
  )
  expect_equal(
    object = metabolites(
      reactionList = c(
        "A[c]",
        "B[protein]A[m_pro]",
        "C[r]",
        "2 5-A[c] + 3 B[c] <=> 5 3D[c] + B[c]"
      ),
      woCompartment = FALSE,uniques = TRUE
    ),
    expected = c("A[c]", "B[protein]A[m_pro]", "C[r]", "5-A[c]", "B[c]","3D[c]")
  )
  expect_equal(
    object = metabolites(
      reactionList = c(
        "A[c]",
        "B[protein]A[m_pro]",
        "C[r]",
        "2 5-A[c] + 3 B[c] <=> 5 3D[c] + B[c]"
      ),
      woCompartment = FALSE,uniques = FALSE
    ),
    expected = c("A[c]", "B[protein]A[m_pro]", "C[r]", "5-A[c]", "B[c]","3D[c]","B[c]")
  )
})

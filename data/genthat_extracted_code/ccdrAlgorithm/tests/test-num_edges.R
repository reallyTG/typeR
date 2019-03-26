context("num.edges")

test_that("num.edges works on SBM", {
    ### Trivial case
    expect_equal(num.edges(generate_empty_SparseBlockMatrixR()), 0)

    ### Non-trivial case
    sbm <- generate_fixed_SparseBlockMatrixR()
    expect_equal(num.edges(sbm), 5)
})

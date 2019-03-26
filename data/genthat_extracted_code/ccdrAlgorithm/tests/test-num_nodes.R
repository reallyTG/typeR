context("num.nodes")

test_that("num.nodes works on SBM", {
    ### Trivial case
    expect_equal(num.nodes(generate_empty_SparseBlockMatrixR()), 1)

    ### Non-trivial case
    sbm <- generate_fixed_SparseBlockMatrixR()
    expect_equal(num.nodes(sbm), 5)
})

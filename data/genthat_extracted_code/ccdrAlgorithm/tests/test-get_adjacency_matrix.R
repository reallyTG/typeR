context("get.adjacency.matrix")

test_that("get.adjacency.matrix works on empty graphs", {
    adj <- generate_empty_adjacency_matrix()

    sbm <- generate_empty_SparseBlockMatrixR()
    expect_equivalent(as.matrix(get.adjacency.matrix(sbm)), adj)
})

test_that("get.adjacency.matrix works on nontrivial graphs", {
    adj <- generate_fixed_adjacency_matrix()

    sbm <- generate_fixed_SparseBlockMatrixR()
    expect_equivalent(as.matrix(get.adjacency.matrix(sbm)), adj)
})


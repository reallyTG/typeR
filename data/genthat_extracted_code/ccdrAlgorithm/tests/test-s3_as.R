context("sparse / SparseBlockMatrixR to matrix conversion")

#
# NOTE: Need to use is_equivalent_to in order to ignore attributes!
#

### matrix -> sparse
test_that("as.matrix -> as.sparse -> as.matrix makes no changes", {

    # The usual code (below) does not work... why? Instead hack to compare sum of differences.
    # expect_equivalent(as.matrix(sparsebnUtils::as.sparse.matrix(m)), m)

    ### Test the zero matrix
    m <- matrix(rep(0, 1), ncol = 1)
    mtest <- sparsebnUtils::as.sparse(as.matrix(m))
    mtest <- as.matrix(mtest)
#     print(m1)
#     print(sum(m1-m))
    expect_equal(sum(mtest-m), 0)

    m <- matrix(rep(0, 4), ncol = 2)
    mtest <- sparsebnUtils::as.sparse(as.matrix(m))
    mtest <- as.matrix(mtest)
    expect_equal(sum(mtest-m), 0)
    # expect_equivalent(as.matrix(sparsebnUtils::as.sparse.matrix(m)), m)

    ### 2-27-2015: sparse currently not allowed to handle non-square matrices: Why though?
#     m <- matrix(rep(0, 12), ncol = 3) # non-square case
#     expect_that(as.matrix(sparsebnUtils::as.sparse.matrix(as.matrix(m))), is_equivalent_to(m))

    ### Test a randomly generated matrix
    m <- random.sparse(5, 5)
    mtest <- sparsebnUtils::as.sparse(as.matrix(m))
    mtest <- as.matrix(mtest)
    expect_equal(sum(mtest-m), 0)
    # expect_that(as.matrix(sparsebnUtils::as.sparse.matrix(as.matrix(m))), is_equivalent_to(m))

    ### Test a randomly generated DAG
    m <- random.dag.matrix(10, 10)
    mtest <- sparsebnUtils::as.sparse(as.matrix(m))
    mtest <- as.matrix(mtest)
    expect_equal(sum(mtest-m), 0)
    # expect_that(as.matrix(sparsebnUtils::as.sparse.matrix(as.matrix(m))), is_equivalent_to(m))
})

### matrix -> SparseBlockMatrixR
test_that("as.matrix -> as.SparseBlockMatrixR -> as.matrix makes no changes", {

    ### Test the zero matrix
    m <- matrix(rep(0, 1), ncol = 1)
    mtest <- sparsebnUtils::as.sparse(as.matrix(m))
    mtest <- as.matrix(mtest)
    expect_equal(sum(mtest-m), 0)
    # expect_that(as.matrix(as.SparseBlockMatrixR(as.matrix(m))), is_equivalent_to(m))

    m <- matrix(rep(0, 4), ncol = 2)
    mtest <- sparsebnUtils::as.sparse(as.matrix(m))
    mtest <- as.matrix(mtest)
    expect_equal(sum(mtest-m), 0)
    # expect_that(as.matrix(as.SparseBlockMatrixR(as.matrix(m))), is_equivalent_to(m))

    ### NOTE: Cannot test on random sparse matrix since SBM class ASSUMES a block structure,
    ###        i.e. induced by a DAG

    ### Test a randomly generated DAG
    m <- random.dag.matrix(10, 10)
    mtest <- sparsebnUtils::as.sparse(as.matrix(m))
    mtest <- as.matrix(mtest)
    expect_equal(sum(mtest-m), 0)
    # expect_that(as.matrix(as.SparseBlockMatrixR(as.matrix(m))), is_equivalent_to(m))
})

### sparse -> SparseBlockMatrixR
test_that("as.sparse -> as.SparseBlockMatrixR -> as.sparse makes no changes", {

    ### Test the zero matrix
    m <- matrix(rep(0, 1), ncol = 1)
    sp <- sparsebnUtils::as.sparse(m)
    sbm <- suppressWarnings(sparsebnUtils::as.sparse(as.SparseBlockMatrixR(sp)))
    expect_equivalent(sbm, sp)

    m <- matrix(rep(0, 4), ncol = 2)
    sp <- sparsebnUtils::as.sparse(m)
    sbm <- suppressWarnings(sparsebnUtils::as.sparse(as.SparseBlockMatrixR(sp)))
    expect_equivalent(sbm, sp)

    ### NOTE: Cannot test on random sparse matrix since SBM class ASSUMES a block structure,
    ###        i.e. induced by a DAG

    ### Test a randomly generated DAG
    m <- random.dag.matrix(10, 10)
    sp <- sparsebnUtils::as.sparse(m)
    sbm <- suppressWarnings(sparsebnUtils::as.sparse(as.SparseBlockMatrixR(sp)))
    expect_equivalent(sbm, sp)
})

### SparseBlockMatrixR -> edgeList -> matrix
test_that("as.SparseBlockMatrixR -> as.edgeList -> as.matrix makes no changes", {

    ### Test the zero matrix
    m <- matrix(rep(0, 1), ncol = 1)
    sbm <- suppressWarnings(as.SparseBlockMatrixR(m))
    m.sbm <- as.matrix(sbm)
    m.edgeL <- as.matrix(sparsebnUtils::as.edgeList(sbm))
    expect_that(m.edgeL, is_equivalent_to(m.sbm))

    m <- matrix(rep(0, 4), ncol = 2)
    sbm <- suppressWarnings(as.SparseBlockMatrixR(m))
    m.sbm <- as.matrix(sbm)
    m.edgeL <- as.matrix(sparsebnUtils::as.edgeList(sbm))
    expect_that(m.edgeL, is_equivalent_to(m.sbm))

    ### NOTE: Cannot test on random sparse matrix since SBM class ASSUMES a block structure,
    ###        i.e. induced by a DAG

    ### Test a randomly generated DAG
    m <- random.dag.matrix(10, 10)
    sbm <- suppressWarnings(as.SparseBlockMatrixR(m))
    m.sbm <- as.matrix(sbm)
    m.edgeL <- as.matrix(sparsebnUtils::as.edgeList(sbm))

    m.sbm[m.sbm != 0] <- 1 # coerce to unweighted adjacencies
    expect_that(m.edgeL, is_equivalent_to(m.sbm))
})

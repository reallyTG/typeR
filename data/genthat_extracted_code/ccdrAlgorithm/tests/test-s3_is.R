context("is.___ s3 methods")

### S3 sparse
test_that("is.sparse works as expected", {
    li <- list(rows = integer(0), cols = integer(0), vals = numeric(0), dim = c(1,1), start = 1)
    sp <- sparsebnUtils::sparse(li)
    expect_is(sp, "sparse")

    expect_true(sparsebnUtils::is.sparse(sp))
    expect_false(sparsebnUtils::is.sparse(list(0)))
})

### S3 SparseBlockMatrixR
test_that("is.SparseBlockMatrixR works as expected", {
    # "rows", "vals", "blocks", "sigmas", "start"
    li <- list(rows = list(integer(0)), vals = list(numeric(0)), blocks = list(integer(0)), sigmas = numeric(0), start = 1)
    sbm <- SparseBlockMatrixR(li)
    expect_is(sbm, "SparseBlockMatrixR")

    expect_true(is.SparseBlockMatrixR(sbm))
    expect_false(is.SparseBlockMatrixR(list(0)))
})

### S3 edgeList
test_that("is.edgeList works as expected", {
    edgeL <- generate_fixed_edgeList()
    expect_is(edgeL, "edgeList")

    expect_true(sparsebnUtils::is.edgeList(edgeL))
    expect_false(sparsebnUtils::is.edgeList(list(0)))
})

### S3 sparsebnFit
test_that("is.sparsebnFit works as expected", {
    # "sbm", "lambda", "nedge", "pp", "nn", "time"
    li <- list(rows = list(integer(0)), vals = list(numeric(0)), blocks = list(integer(0)), sigmas = numeric(0), start = 1)

    sbf <- generate_fixed_sparsebnFit()
    expect_is(sbf, "sparsebnFit")

    expect_true(sparsebnUtils::is.sparsebnFit(sbf))
    expect_false(sparsebnUtils::is.sparsebnFit(list(0)))
})

test_that("is.sparsebnFit checks correctness of nedge", {
    edges <- generate_fixed_edgeList()

    # nedge = 5, but is set to 0 below: Should throw error!
    li <- list(edges = edges, lambda = pi, nedge = 0, pp = 5, nn = 10, time = runif(1))
    expect_error(sparsebnUtils::sparsebnFit(li))
})

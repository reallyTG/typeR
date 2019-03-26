context("select")

sbp <- generate_nontrivial_sparsebnPath()

test_that("Selection by number of edges works", {
    expect_equal(select(sbp, edges = 0), sbp[[1]])
    expect_equal(select(sbp, edges = 4), sbp[[2]])
    expect_equal(select(sbp, edges = 5), sbp[[3]])
    expect_equal(select(sbp, edges = 7), sbp[[4]])
})

test_that("Selection by lambda works", {
    expect_equal(select(sbp, lambda = 2.1), sbp[[1]])
    expect_equal(select(sbp, lambda = 1.54), sbp[[2]])
    expect_equal(select(sbp, lambda = 0.97), sbp[[3]])
    expect_equal(select(sbp, lambda = 0.57), sbp[[4]])
})

test_that("Partial matching for lambda works", {
    ### This tests the case where the absolute difference is == tol (see pmatch_numeric)
    expect_true(is.null(select(sbp, lambda = 2)))

    expect_equal(select(sbp, lambda = 2.05), sbp[[1]])
    expect_equal(select(sbp, lambda = 1.5), sbp[[2]])
    expect_equal(select(sbp, lambda = 0.9), sbp[[3]])
    expect_equal(select(sbp, lambda = 0.5), sbp[[4]])
})

test_that("Selection by index works", {
    expect_equal(select(sbp, index = 1), sbp[[1]])
    expect_equal(select(sbp, index = 2), sbp[[2]])
    expect_equal(select(sbp, index = 3), sbp[[3]])
    expect_equal(select(sbp, index = 4), sbp[[4]])
})


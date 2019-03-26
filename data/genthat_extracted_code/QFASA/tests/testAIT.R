test_that("Aitchison Distinance Measure", {
    
    x.1 <- c(1,1,1,1,1)
    x.2 <- c(2,99,99,99,99)
    expect_equal(QFASA:::AIT.dist(x.1, x.2), 3.49003, tolerance=1e-6)

    x.1 <- c(1,1,1,1,1)
    x.2 <- c(0,0,0,0,0)
    expect_equal(is.nan(QFASA:::AIT.dist(x.1, x.2)), TRUE)
})

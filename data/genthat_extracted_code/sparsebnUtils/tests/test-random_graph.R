context("random.graph")

test_that("random.graph runs as expected", {
    expect_error(random.graph(5, 5, acyclic = TRUE, loops = TRUE), NA)
    expect_error(random.graph(5, 5, acyclic = TRUE, loops = FALSE), NA)
    expect_error(random.graph(5, 5, acyclic = FALSE, loops = TRUE), NA)
    expect_error(random.graph(5, 5, acyclic = FALSE, loops = FALSE), NA)
})

test_that("random.graph does not produce loops", {
    gr <- random.graph(5, 5, loops = FALSE)
    m <- as.matrix(gr)
    expect_equivalent(diag(m), rep(0, 5))
})


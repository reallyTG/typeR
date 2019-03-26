if (requireNamespace("lintr", quietly = TRUE)) {
    context("lintr")

    describe("lintr", {
        test_that("lintr", {
            lintr::expect_lint_free()
        })
    })
}

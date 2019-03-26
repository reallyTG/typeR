extract_tests <- system.file("tests", "testthat", "test-crochet-extract.R", package = "crochet")

if (extract_tests == "") {

    test_that("subsetting", {
        skip("crochet tests have to be installed")
    })

} else {

    n <- 4L
    p <- 4L
    dimnames <- list(
        paste0("row_", seq_len(n)),
        paste0("col_", seq_len(p))
    )

    CROCHET_EXTRACT_ENV <- new.env()
    CROCHET_EXTRACT_ENV$COMPARE_OBJECT <- createMatrix(n, p, dimnames)
    CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT <- (n * p) + 1L
    CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR <- "col_1000"

    context("ColumnLinkedMatrix with 2 nodes")
    CROCHET_EXTRACT_ENV$CUSTOM_OBJECT <- createLinkedMatrix(n, p, dimnames, "ColumnLinkedMatrix", 2L)
    source(extract_tests, local = TRUE)

    context("RowLinkedMatrix with 2 nodes")
    CROCHET_EXTRACT_ENV$CUSTOM_OBJECT <- createLinkedMatrix(n, p, dimnames, "RowLinkedMatrix", 2L)
    source(extract_tests, local = TRUE)

}

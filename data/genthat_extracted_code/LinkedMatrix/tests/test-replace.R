replace_tests <- system.file("tests", "testthat", "test-crochet-replace.R", package = "crochet")

if (replace_tests == "") {

    test_that("replacement", {
        skip("crochet tests have to be installed")
    })

} else {

    n <- 4L
    p <- 4L
    dimnames <- list(
        paste0("row_", seq_len(n)),
        paste0("col_", seq_len(p))
    )

    reset <- function() {
        .GlobalEnv$Y <- createMatrix(n, p, dimnames)
        .GlobalEnv$X <- createLinkedMatrix(n, p, dimnames, "ColumnLinkedMatrix", 2L)
    }

    CROCHET_REPLACE_ENV <- new.env()
    CROCHET_REPLACE_ENV$COMPARE_OBJECT <- createMatrix(n, p, dimnames)
    CROCHET_REPLACE_ENV$VALUE_POOL <- 0:9
    CROCHET_REPLACE_ENV$OUT_OF_BOUNDS_INT <- (n * p) + 1L
    CROCHET_REPLACE_ENV$OUT_OF_BOUNDS_CHAR <- "snp1000_U"
    CROCHET_REPLACE_ENV$SKIP_OUT_OF_BOUNDS_TESTS <- TRUE

    context("ColumnLinkedMatrix with 2 nodes")
    CROCHET_REPLACE_ENV$CUSTOM_OBJECT <- createLinkedMatrix(n, p, dimnames, "ColumnLinkedMatrix", 2L)
    CROCHET_REPLACE_ENV$RESET <- function() {
        CROCHET_REPLACE_ENV$COMPARE_OBJECT <- createMatrix(n, p, dimnames)
        CROCHET_REPLACE_ENV$CUSTOM_OBJECT <- createLinkedMatrix(n, p, dimnames, "ColumnLinkedMatrix", 2L)
    }
    source(replace_tests, local = TRUE)

    context("RowLinkedMatrix with 2 nodes")
    CROCHET_REPLACE_ENV$CUSTOM_OBJECT <- createLinkedMatrix(n, p, dimnames, "RowLinkedMatrix", 2L)
    CROCHET_REPLACE_ENV$RESET <- function() {
        CROCHET_REPLACE_ENV$COMPARE_OBJECT <- createMatrix(n, p, dimnames)
        CROCHET_REPLACE_ENV$CUSTOM_OBJECT <- createLinkedMatrix(n, p, dimnames, "RowLinkedMatrix", 2L)
    }
    source(replace_tests, local = TRUE)

}

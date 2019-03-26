library(mnis)
context("lords_types")


test_that("mnis_lords_type returns expected format", {

    skip_on_cran()

    xlt <- mnis_lords_type(date = '2017-01-01')
    expect_true(tibble::is_tibble(xlt))
    expect_length(xlt, 6)
    expect_type(xlt, "list")

    xltmessy <- mnis_lords_type(date = '2017-01-01', tidy=FALSE)
    expect_true(tibble::is_tibble(xltmessy))
    expect_length(xltmessy, 6)
    expect_type(xltmessy, "list")

    xpod <- mnis_peers_on_date("2017-01-01")
    expect_true(tibble::is_tibble(xpod))
    expect_length(xpod, 21)
    expect_type(xpod, "list")
    expect_true(nrow(xpod)==843)

  })


## vim:textwidth=80:expandtab:shiftwidth=4:softtabstop=4
context("secchi")
test_that("secchi has correct form", {
          data("secchi", package="ocedata")
          expect_true(is.data.frame(secchi))
          expect_equal(4, sum(c("latitude", "longitude", "depth", "time") %in% names(secchi)))
})


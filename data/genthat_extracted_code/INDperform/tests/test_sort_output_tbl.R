context("test sort_output_tbl")

mod_tbl <- model_gam(ind_init_ex[c(1:7), ])
test <- names(mod_tbl)
x <- names(sort_output_tbl(mod_tbl))

# Test with a random dataset
test_df <- ggplot2::diamonds
class(test_df)

sorted <- sort_output_tbl(test_df)

test_that("test sort_output_tbl", {
  expect_true(unique(test == x))
  expect_equal(test[6], "aic")
  # Test type stability of input:
  expect_equal(class(test_df), class(sorted))
  expect_equal(ncol(sorted), ncol(test_df))
})

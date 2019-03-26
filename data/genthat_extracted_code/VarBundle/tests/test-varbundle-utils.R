
# list of comparison functions (list, data.frame)
LIST_DF <- list(
  same_num_vars = function(ll, df) {
    testthat::expect_equal(length(ll), nrow(df))
  },

  same_var_names = function(ll, df) {
    testthat::expect_equal(names(ll), df$var)
  },

  vals_correct_type = function(ll, df) {
    skip_if_not_installed("purrr")

    purrr::walk(1:nrow(df), function(i) {
      var <- df$var[i]
      val <- df$val[i]
      type <- df$type[i]
      testthat::expect_equal(class(ll[[var]]), type)
    })
  }
)

## UNIT TESTS ------------------------------------------------------------------

testthat::test_that("simple case", {

  df <- tibble::tibble(var = c("a","b","c"),
                       val = c("1", "2", "3"),
                       type = c("numeric"))

  ll <- df_to_list(df)

  LIST_DF$same_num_vars(ll, df)
  LIST_DF$same_var_names(ll, df)


  LIST_DF$vals_correct_type(ll, df)
})


testthat::test_that("field names", {
  ll <- list(a = 1, b = 2, c = 3)
  vb <- varbundle(ll)
  testthat::expect_equal(field_names(vb), names(ll))
})


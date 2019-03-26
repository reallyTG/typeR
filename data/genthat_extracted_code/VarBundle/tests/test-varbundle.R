
# vb has same values as list ll
same_vals_test <- function(vb, ll) {
  skip_if_not_installed("purrr")

  purrr::walk(1:length(ll), function(i) {
    testthat::expect_equal(ll[[i]], vb[[names(ll)[i]]])
  })
}

# vb has values with same class as ll
same_val_classes_test <- function(vb, ll) {
  skip_if_not_installed("purrr")

  purrr::walk(1:length(ll), function(i) {
    testthat::expect_equal(class(ll[[i]]), class(vb[[names(ll)[i]]]))
  })
}

testthat::test_that("example_test", {
  testthat::expect_true(TRUE)
})


testthat::test_that("has same vals as list", {
  ll <- list(min = 100, sample_perc = 0.3, file = "bar", debug = FALSE)
  vb <- varbundle(ll)
  same_vals_test(vb, ll)
})

testthat::test_that("has vals with same classes as list", {
  ll <- list(min = 100, sample_perc = 0.3, file = "bar", debug = FALSE)
  vb <- varbundle(ll)
  same_val_classes_test(vb, ll)
})


testthat::test_that("has same var names as list", {
  ll <- list(min = 100, sample_perc = 0.3, file = "bar", debug = FALSE)
  vb <- varbundle(ll)
  testthat::expect_equal(sum(names(ll) %in% names(vb)), length(ll))
})

testthat::test_that("throws error on list w/ missing names", {
  ll <- list(100, sample_perc = 0.3, file = "bar", debug = FALSE)
  testthat::expect_error(vb <- varbundle(ll),
    regexp = MSG$all_names
  )
})

testthat::test_that("throws error on list w/ no names", {
  ll <- list(100, 0.3, "bar", FALSE)
  testthat::expect_error(vb <- varbundle(ll),
    regexp = MSG$no_names
  )
})


testthat::test_that("throws error on non-unique names", {
  ll <- list(foo = 1, bar = 2, bar = 3)
  testthat::expect_error(vb <- varbundle(ll),
    regexp = MSG$not_unique
  )
})


testthat::test_that("not list", {
  ll <- c(foo = 1, bar = 2, bar = 3)
  testthat::expect_error(vb <- varbundle(ll),
    regexp = MSG$valid_x
  )
})

testthat::test_that("read only fields", {
  ll <- list(foo = 1, bar = 2)
  vb <- varbundle(ll)
  testthat::expect_error(vb$foo <- 5,
    regexp = MSG$read_only
  )
})


testthat::test_that("handles NA as vals", {
  ll <- list(foo = 1, bar = NA)
  vb <- varbundle(ll)
  testthat::expect_true(is.na(vb$bar))
  same_vals_test(vb, ll)
  same_val_classes_test(vb, ll)
})

testthat::test_that("throws error on empty list", {
  ll <- list()
  testthat::expect_error(vb <- varbundle(ll),
    regexp = MSG$not_empty
  )
})


testthat::test_that("throws error on NULL", {
  ll <- NULL
  testthat::expect_error(vb <- varbundle(ll),
    regexp = MSG$not_null
  )
})



testthat::test_that("handles atomic vectors with > 1 items", {
  vec <- c("my", "dog", "has", "fleas")
  ll <- list(a = 1, b = 2, vec = vec)
  vb <- varbundle(ll)
  testthat::expect_equal(vb$vec, vec)
  same_vals_test(vb, ll)
  same_val_classes_test(vb, ll)
})

testthat::test_that("handles non-atomic list items", {
  df <- data.frame(foo = 1:5)
  ll <- list(a = 1, b = 2, my_df = df)
  vb <- varbundle(ll)
  testthat::expect_equal(vb$my_df, df)
  same_vals_test(vb, ll)
  same_val_classes_test(vb, ll)
})

testthat::test_that("handles nested varbundles", {
  sales <- varbundle(list(min = 100, max = 10000))
  units <- varbundle(list(min = 10, max = 50))
  ll <- list(sales = sales, units = units)
  thresholds <- varbundle(ll)
  same_vals_test(thresholds, ll)
  same_val_classes_test(thresholds, ll)
  testthat::expect_reference(thresholds$sales, sales)
})


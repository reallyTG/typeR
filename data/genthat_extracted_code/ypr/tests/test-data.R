context("data")

test_that("data", {
  expect_identical(check_population(adams_bt_03), adams_bt_03)
  expect_identical(check_populations(chilliwack_bt_05), chilliwack_bt_05)
  expect_identical(check_population(kootenay_bt_13), kootenay_bt_13)
  expect_identical(check_population(kootenay_rb_13), kootenay_rb_13)
  expect_identical(check_population(quesnel_bt), quesnel_bt)
  expect_identical(check_population(quesnel_lt), quesnel_lt)
  expect_identical(check_population(quesnel_rb), quesnel_rb)
})

test_that(".data", {
  expect_identical(check_data(
    .parameters,
    values = list(
      Parameter = "",
      Grouping = ordered(""),
      Subgrouping = ordered(""),
      Importance = ordered(""),
      Lower = c(-10, 2),
      Upper = c(0.1, 1e+06),
      Integer = c(0L,1L),
      Log = c(0L, 1L)),
    key = "Parameter", exclusive = TRUE, order = TRUE),
    .parameters)
})

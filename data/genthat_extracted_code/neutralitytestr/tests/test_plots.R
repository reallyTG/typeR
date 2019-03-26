test_that("neutralitytest returns correct object", {
  expect_is(vaf_histogram(neutralitytest(VAFneutral)), "ggplot")
  expect_is(normalized_plot(neutralitytest(VAFneutral)), "ggplot")
  expect_is(lsq_plot(neutralitytest(VAFneutral)), "ggplot")
  expect_is(plot_all(neutralitytest(VAFneutral)), "ggplot")
})

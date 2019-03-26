context("plotting functions")

test_that("plot class output", {
  suppressWarnings(RNGversion("3.5.0"))
  set.seed(42)
  plot_df = data.frame(lab=letters,
                       val=rexp(26),
                       stringsAsFactors = FALSE)
  expect_s3_class(
    plotly_packed_bar(plot_df, 'lab', 'val'),
    c("plotly", "htmlwidget")
  )
})

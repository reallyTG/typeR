test_that("plot_unit_curve produces a ggplot object", {
  
  expect_that(any(class(plot_unit_curve(t = 100, m = 1, n = 125, r = .85, model = "ca", level = "c")) %in% "ggplot"), is_true())
  
})

test_that("plot_block_summary produces a ggplot object", {
  
  expect_that(any(class(plot_block_summary(t = 125, m = 201, n = 500, r = .75)) %in% "ggplot"), is_true())
  
})

test_that("plot_delta produces a ggplot object", {
  
  expect_that(any(class(plot_delta(t = 50, m = 1, n = 25, r = .885, level = "c")) %in% "ggplot"), is_true())
  
})
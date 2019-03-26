context("virtual_beam_cross_detector")

test_that("virtual_beam_cross_detector works", {
  library(behavr)
  dt <- toy_ethoscope_data(duration=days(.2))
  dt[, test:= rnorm(nrow(dt))]
  data <- dt[,-c("id")]
  #data[t %in% c(10.5, 11, 11.5, 1001, 3401.5), has_interacted := 1]

  small_d <- virtual_beam_cross_detector(data, 10)
  sum(small_d[, moving])
})


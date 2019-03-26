test_that("interactive_threshold",
{
  iniv <- "0%" # initial value is "0%"
  names(iniv) <- "threshold"
  expected <- image_threshold(img, threshold = iniv)
  expect_equal(expected, interactive_threshold(img))
  expect_equal(iniv, interactive_threshold(img, return_param = TRUE))
})

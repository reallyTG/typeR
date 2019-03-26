test_that("interactive_reducenoise",
{
  iniv <- 0 # initial value is 0
  names(iniv) <- "radius"
  expected <- image_reducenoise(img, iniv)
  expect_equal(expected, interactive_reducenoise(img))
  expect_equal(iniv, interactive_reducenoise(img, return_param = TRUE))
})

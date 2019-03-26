test_that("interactive_modulate",
{
  iniv <- c(100, 100, 100) # initial value is 100
  names(iniv) <- c("brightness", "saturation", "hue")
  expected <- image_modulate(img, iniv[1], iniv[2], iniv[3])
  expect_equal(expected, interactive_modulate(img))
  expect_equal(iniv, interactive_modulate(img, return_param = TRUE))
})

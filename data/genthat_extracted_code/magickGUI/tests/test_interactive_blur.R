test_that("interactive_blur",
{
  iniv <- c(0,0) # initial value is 0
  names(iniv) <- c("radius", "sigma")
  expected <- image_blur(img, iniv[1], iniv[2])
  expect_equal(expected, interactive_blur(img))
  expect_equal(iniv, interactive_blur(img, return_param = TRUE))
})

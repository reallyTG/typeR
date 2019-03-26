test_that("interactive_oilpaint",
{
  iniv <- 0 # initial value is 0
  names(iniv) <- "radius"
  expected <- image_oilpaint(img, iniv)
  expect_equal(expected, interactive_oilpaint(img))
  expect_equal(iniv, interactive_oilpaint(img, return_param = TRUE))
})

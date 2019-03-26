test_that("interactive_charcoal",
{
  iniv <- c(0,0) # initial value is 0
  names(iniv) <- c("radius", "sigma")
  expected <- image_charcoal(img, iniv[1], iniv[2])
  expect_equal(expected, interactive_charcoal(img))
  expect_equal(iniv, interactive_charcoal(img, return_param = TRUE))
})

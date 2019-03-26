test_that("interactive_emboss",
{
  iniv <- c(0,0) # initial value is 0
  names(iniv) <- c("radius", "sigma")
  expected <- image_emboss(img, iniv[1], iniv[2])
  expect_equal(expected, interactive_emboss(img))
  expect_equal(iniv, interactive_emboss(img, return_param = TRUE))
})

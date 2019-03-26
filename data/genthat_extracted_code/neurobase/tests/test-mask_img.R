test_that("masking image", {
  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  mask = abs(nim) > 1
  masked = mask_img(nim, mask)
  expect_equal(sum(masked), 9.96328284661544)
  mask[mask == 0] = NA
  
  na_masked = mask_img(nim, mask, allow.NA = TRUE)
  expect_equal(sum(na_masked, na.rm = TRUE), 9.96328284661544)
  expect_error(mask_img(nim, mask, allow.NA = FALSE))
})
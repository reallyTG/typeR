test_that("mask checking", {
  set.seed(5)
  arr = array(rbinom(1000, size = 1, prob = 0.2), dim = c(10,10,10))
  nim = oro.nifti::nifti(arr)
  expect_equal(check_mask(nim), TRUE)
  
  nim[5,5,5] = 4
  expect_equal(check_mask(nim), FALSE)
  
  expect_error(check_mask_fail(nim), 
               "Mask must be binary 0/1.  If it has NAs, allow.NA must be TRUE")
})

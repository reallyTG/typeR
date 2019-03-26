test_that("masking image", {
  
  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  mask = abs(nim) > 1
  rim = randomize_mask(nim, mask)
  
  expect_equal(mean(rim), mean(nim))
  expect_equal(mean(rim[mask == 1]), mean(nim[mask == 1]))
  expect_equal(sort(rim[mask == 1]), sort(nim[mask == 1]))
  
  mask[ mask == 0] = NA
  expect_error(randomize_mask(nim, mask))
})

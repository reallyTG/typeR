test_that("dropping and applying dropping dimensions", {
  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  arr[,,10] = 0
  nim = oro.nifti::nifti(arr)
  
  dnim = dropEmptyImageDimensions(nim, keep_ind = TRUE)
  
  expect_identical(dropEmptyImageDimensions(nim, keep_ind = TRUE),
               drop_empty_dim(nim, keep_ind = TRUE))
  
  new_nim = dnim$outimg
  expect_equal(dim(new_nim), c(10, 10, 9))
  expect_equal(names(dnim), c("outimg", "inds", "orig.dim"))
  new_nim = apply_empty_dim(img = nim, inds = dnim$inds)
  expect_equal(dim(new_nim), c(10, 10, 9))
})
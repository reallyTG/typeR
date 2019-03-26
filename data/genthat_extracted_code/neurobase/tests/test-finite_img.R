test_that("finite_img", {
  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  arr[,,10] = NaN
  arr[1,2,3] = NA
  arr[1,2,4] = Inf
  nim = oro.nifti::nifti(arr)

  expect_false(all(is.finite(nim)))
  new_nim = finite_img(nim)
  
  expect_true(all(is.finite(new_nim)))
  
  expect_equal(sum(new_nim), 25.552064333968)
  
  #################################
  # replace with NAs
  #################################
  new_nim = finite_img(nim, replace = NA)
  expect_false(all(is.finite(new_nim)))
  expect_equal(sum(new_nim, na.rm = TRUE), 25.552064333968)  
  
  #################################
  # replace with non-zero
  #################################
  new_nim = finite_img(nim, replace = 4)
  expect_true(all(is.finite(new_nim)))
  
  expect_equal(sum(new_nim), 433.552064333968)    
  
})
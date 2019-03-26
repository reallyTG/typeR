test_that("cog", {
  set.seed(5)
  dims = rep(10, 3)
  
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  mystr = "FLOAT32"
  datatype(nim) <- convert.datatype()[[mystr]]
  bitpix(nim) <- convert.bitpix()[[mystr]]
  nim = cal_img(nim)
  
  ee = structure(c(5.45383104125737, 5.44597249508841, 5.62671905697446
  ), .Names = c("dim1", "dim2", "dim3"))
  expect_equal(cog(nim), ee)
  
  expect_equal(xyz(nim), ceiling(ee))
  
})


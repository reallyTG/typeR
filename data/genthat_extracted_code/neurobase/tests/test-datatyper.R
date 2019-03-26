test_that("data_typer_float", {
  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  mystr = "FLOAT32"
  
  expect_silent({dnim = datatyper(nim, warn = FALSE)})
  expect_warning({dnim = datatyper(nim)}, "Assuming FLOAT32")
  
  expect_equal(datatype(dnim), 16)
  expect_equal(bitpix(dnim), 32)
})

test_that("data_typer_mask", {
  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  nim = abs(nim) > 1.5
  mystr = "FLOAT32"
  datatype(nim) <- convert.datatype()[[mystr]]
  bitpix(nim) <- convert.bitpix()[[mystr]]  
  
  dnim = datatyper(nim, trybyte = FALSE)
  
  expect_equal(datatype(dnim), 2)
  expect_equal(bitpix(dnim), 8)
  
  dnim = datatyper(nim, trybyte = TRUE)
  expect_equal(datatype(dnim), 2)
  expect_equal(bitpix(dnim), 8)  
  
})
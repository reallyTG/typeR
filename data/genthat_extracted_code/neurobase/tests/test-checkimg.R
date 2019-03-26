test_that("check_nifti", {
  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  mystr = "FLOAT32"
  datatype(nim) <- convert.datatype()[[mystr]]
  bitpix(nim) <- convert.bitpix()[[mystr]]
  nim = cal_img(nim)
  tfile = "test-check_nifti_output.nii.gz"
  if (file.exists(tfile)) {
    file.remove(tfile)
  }
  
  ####################################
  # checkimg with file doesn't exist
  ####################################
  # expect_equal(checkimg(tfile), file.path(".", tfile))
  # fails on windows
  writenii(nim = nim, filename = tfile)
  if (file.exists(tfile)) {
    tfile = normalizePath(tfile)
  }
  
  ##################################
  # checkimg
  ##################################  
  expect_equal(checkimg(tfile), tfile)
  
  ##################################
  # check_nifti
  ##################################  
  expect_equal(check_nifti(nim), nim)
  # get a tolerance difference 
  expect_equal(check_nifti(tfile), nim, tolerance = 1e-5)
  # expect_true(all(abs(check_nifti(tfile) - nim) < 1e-5))
  file.remove(tfile)
    
})
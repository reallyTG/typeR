test_that("checknii", {
  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  mystr = "FLOAT32"
  datatype(nim) <- convert.datatype()[[mystr]]
  bitpix(nim) <- convert.bitpix()[[mystr]]
  nim = cal_img(nim)
  tfile = tempfile(fileext = ".nii.gz")
  if (file.exists(tfile)) {
    file.remove(tfile)
  }
  
  ####################################
  # Make a temporary file
  ####################################
  writenii(nim = nim, filename = tfile)
  tfile = normalizePath(tfile)
  
  
  ####################################
  # Making sure .nii.gz is working right
  ####################################
  expect_equal(checkniigz(tfile), tfile)
  expect_equal(ensure_nii_gz(tfile), tfile)
  
  ####################################
  # Making sure .nii  is working right
  ####################################  
  nii_file = checknii(tfile)
  expect_true(file.exists(nii_file))
  expect_match(nii_file, "[.]nii$")
  
  nii_file = ensure_nii(tfile)  
  expect_true(file.exists(nii_file))
  expect_match(nii_file, "[.]nii$")
  
  ####################################
  # Making sure .nii.gz  is working right 
  # when nii is put in
  ####################################  
  niigz_file = checkniigz(nii_file)
  expect_true(file.exists(niigz_file))
  expect_match(niigz_file, "[.]nii[.]gz$")
  
  niigz_file = ensure_nii_gz(nii_file)  
  expect_true(file.exists(niigz_file))
  expect_match(niigz_file, "[.]nii[.]gz$")
  
})
test_that("file_imgext", {
  apps = c(outer(c("hdr", "nii"), c("", ".gz"), paste0))
  fnames = paste0("test.", apps)
  
  expect_equal(file_imgext(fnames), 
               c(".hdr", ".nii", ".hdr.gz", ".nii.gz"))
  
  expect_equal(file_imgext(fnames, withdot = FALSE), 
               c("hdr", "nii", "hdr.gz", "nii.gz"))  
  
  expect_true(is.na(file_imgext("test.img")))
  
})
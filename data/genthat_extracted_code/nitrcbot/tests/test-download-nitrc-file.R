test_that("download_nitrc_file", {
  skip_on_cran()
  testthat::expect_is(download_nitrc_file("/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-05.nii.gz"),"character")
  testthat::expect_is(download_nitrc_file("/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-05.nii.gz", verbose = TRUE),"character")
  testthat::expect_null(download_nitrc_file("/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-05.nii.gz1"))
  testthat::expect_equal(basename(download_nitrc_file("/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-05.nii.gz")),"IXI012-HH-1211-DTI-05.nii.gz")
  testthat::expect_equal(basename(download_nitrc_file("/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-05.nii.gz", prefix = "42")),"42_IXI012-HH-1211-DTI-05.nii.gz")
  testthat::expect_error(download_nitrc_file("/data/experiments/NITRC_IR_E10453/scans/DTI/resources/77382/files/IXI012-HH-1211-DTI-05.nii.gz1", error = TRUE))
})

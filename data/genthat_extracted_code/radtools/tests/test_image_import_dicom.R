
# Note: explicitly set environment variable NOT_CRAN to "true" (e.g. on command line) to run skipped tests

test_that("DICOM image data to 3D matrix - for CRAN", {
  expect_equal(dim(img_data_to_3D_mat(sample_dicom_img)), c(256, 256, 3))
  expect_error(img_data_to_3D_mat(sample_dicom_img, coord_extra_dim = 1))
  expect_equal(dim(img_data_to_3D_mat(sample_dicom_img)), c(256, 256, 3))
  expect_error(img_data_to_3D_mat(sample_dicom_img, coord_extra_dim = 1))
})

test_that("DICOM image data to matrix - for CRAN", {
  expect_equal(dim(img_data_to_mat(sample_dicom_img)), c(256, 256, 3))
})

test_that("Matrix reduce dimensions", {
  expect_error(mat_reduce_dim(1:5))

  mat0 <- NULL
  expect_error(mat_reduce_dim(mat0, 5))

  mat1 <- array(1:5)
  expect_equal(mat_reduce_dim(mat1, NULL), mat1)
  expect_equal(mat_reduce_dim(mat1, 5), 5)
  expect_error(mat_reduce_dim(mat1, c(1,2)))

  mat2 <- array(dim = c(5,5))
  mat2[2,3] <- 3
  mat2[5,2] <- 5
  expect_equal(mat_reduce_dim(mat2, 3), c(NA, 3, NA, NA, NA))
  expect_equal(mat_reduce_dim(mat2, 2), c(NA, NA, NA, NA, 5))
  expect_equal(mat_reduce_dim(mat2, c(2,3)), 3)
  expect_true(is.na(mat_reduce_dim(mat2, c(2,4))))

  mat3 <- array(dim = c(5,5,5))
  mat3[1,2,3] <- 4
  expect_error(mat_reduce_dim(mat3, c(1,2,3,4)))
  expect_equal(mat_reduce_dim(mat3, 3)[1,2], 4)
  expect_equal(dim(mat_reduce_dim(mat3, 3)), c(5,5))
  expect_equal(length(mat_reduce_dim(mat3, c(2,2))), 5)
  expect_equal(length(mat_reduce_dim(mat3, c(2,2,2))), 1)
})

test_that("DICOM import - for CRAN", {
  # Invalid DICOM files
  expect_error(xfun::normalize_path(read_dicom(file.path(dir_d_clunie_dicom_deflate, "image_dfl"))))
  expect_error(xfun::normalize_path(read_dicom(file.path(dir_s_barre_dicom, "OT-MONO2-8-colon")))) # Missing 4-byte DICOM prefix
  expect_error(xfun::normalize_path(read_dicom(file.path(dir_s_barre_dicom, "OT-PAL-8-face")))) # Missing 4-byte DICOM prefix

  # D. Clunie scsgreek
  expect_error(img_data_to_3D_mat(dicom_data_dclunie_scsgreek, 1))
  expect_error(img_data_to_mat(dicom_data_dclunie_scsgreek))

  # D. Clunie scx2
  expect_error(img_data_to_3D_mat(dicom_data_dclunie_scsx2, 1))
  expect_error(img_data_to_mat(dicom_data_dclunie_scsx2))

  # D. Clunie deflate image
  expect_error(img_data_to_3D_mat(dicom_data_dclunie_image, 1))
  expect_error(img_data_to_mat(dicom_data_dclunie_image))

  # S. Barre ort
  expect_error(img_data_to_3D_mat(dicom_data_sbarre_ort, 1))
  expect_error(img_data_to_mat(dicom_data_sbarre_ort))
  expect_error(img_data_to_3D_mat(dicom_data_sbarre_ort))

  # S. Barre heart MR
  expect_error(img_data_to_3D_mat(dicom_data_sbarre_heart_mr, 1))
  expect_error(img_data_to_mat(dicom_data_sbarre_heart_mr))
  expect_error(img_data_to_3D_mat(dicom_data_sbarre_heart_mr))

  # S. Barre heart NM
  expect_error(img_data_to_3D_mat(dicom_data_sbarre_heart_nm, 1))
  expect_error(img_data_to_mat(dicom_data_sbarre_heart_nm))
  expect_error(img_data_to_3D_mat(dicom_data_sbarre_heart_nm))

  # S. Barre execho
  expect_error(img_data_to_3D_mat(dicom_data_sbarre_execho, 1))
  expect_error(img_data_to_mat(dicom_data_sbarre_execho))
  expect_error(img_data_to_3D_mat(dicom_data_sbarre_execho))
})


test_that("DICOM import - skip on CRAN", {

  skip_on_cran()

  # No slices
  expect_error(img_data_to_3D_mat(dicom_data_qin_hn_sr))

  # DICOM image data to 3D matrix
  expect_equal(dim(img_data_to_3D_mat(dicom_data_chest)), c(512, 512, 128))
  expect_equal(dim(img_data_to_3D_mat(dicom_data_prostate_mr)), c(384, 384, 19))
  expect_equal(dim(img_data_to_3D_mat(dicom_data_prostate_pt)), c(144, 144, 234))
  expect_error(img_data_to_3D_mat(dicom_data_chest, coord_extra_dim = 1))
  expect_error(img_data_to_3D_mat(dicom_data_bladder)) # Data is missing required header fields for oro.dicom::create3D()
  expect_warning(dim(img_data_to_3D_mat(dicom_data_247_MR3)))
  expect_equal(dim(img_data_to_3D_mat(dicom_data_988_MR700)), c(512, 512, 12))
  expect_error(img_data_to_3D_mat(dicom_data_988_MR700, coord_extra_dim = 1))
  expect_error(img_data_to_3D_mat(dicom_data_247_MR3, coord_extra_dim = 1))
  expect_error(img_data_to_3D_mat(dicom_data_247_OT))
  expect_error(img_data_to_3D_mat(dicom_data_247_OT, coord_extra_dim = 1))

  # DICOM image data to matrix
  expect_equal(dim(img_data_to_mat(dicom_data_chest)), c(512, 512, 128))
  expect_equal(dim(img_data_to_mat(dicom_data_prostate_mr)), c(384, 384, 19))
  expect_equal(dim(img_data_to_mat(dicom_data_prostate_pt)), c(144, 144, 234))
  expect_error(img_data_to_mat(dicom_data_bladder)) # Data is missing required header fields for oro.dicom::create3D()
  expect_equal(dim(img_data_to_mat(dicom_data_988_MR700)), c(512, 512, 12))

  # Make sure we can import all of these with oro.dicom
  for(dir in list.files(dir_pcir_988, full.names = T)) {
    dd <- read_dicom(dir)
    rm(dd)
  }
  for(dir in list.files(dir_d_clunie_dicom_signedrange, full.names = T)) {
    dd <- read_dicom(dir)
    rm(dd)
  }
  for(dir in list.files(dir_pcir_247, full.names = T)) {
    dd <- read_dicom(dir)
    rm(dd)
  }

})


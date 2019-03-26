
test_that("NIfTI import", {

  # NIfTI image data to 3D matrix
  expect_error(img_data_to_3D_mat(nifti_data_filtered_func, coord_extra_dim = 181))
  expect_equal(dim(img_data_to_3D_mat(nifti_data_filtered_func, coord_extra_dim = 180)), c(64, 64, 21))
  expect_error(img_data_to_3D_mat(nifti_data_filtered_func, coord_extra_dim = NULL))
  expect_equal(dim(img_data_to_3D_mat(nifti_data_filtered_func, coord_extra_dim = c(180))), c(64, 64, 21))
  expect_error(img_data_to_3D_mat(nifti_data_filtered_func, coord_extra_dim = c(1,1)))
  expect_error(img_data_to_3D_mat(nifti_data_filtered_func))
  expect_error(img_data_to_3D_mat(nifti_data_avg152T1_LR, coord_extra_dim = 5))
  expect_error(img_data_to_3D_mat(nifti_data_avg152T1_LR, coord_extra_dim = c(1,1)))
  expect_equal(dim(img_data_to_3D_mat(nifti_data_avg152T1_LR)), c(91, 109, 91))

  # NIfTI image data to matrix
  expect_equal(dim(img_data_to_mat(nifti_data_filtered_func)), c(64, 64, 21, 180))
  expect_equal(dim(img_data_to_mat(nifti_data_avg152T1_LR)), c(91, 109, 91))
  expect_equal(dim(img_data_to_mat(sample_nifti_img)), c(64,64,10))

  # nifti_data_1103_3
  expect_equal(dim(img_data_to_mat(nifti_data_1103_3)), c(256,256,332))
  expect_equal(dim(img_data_to_3D_mat(nifti_data_1103_3)), c(256,256,332))

  # nifti_data_113_01_MPRAGE_mask
  expect_equal(dim(img_data_to_3D_mat(nifti_data_113_01_MPRAGE_mask)), c(170,256,256))
  expect_equal(dim(img_data_to_mat(nifti_data_113_01_MPRAGE_mask)), c(170,256,256))

  # nifti_data_avg152T1_LR_hi
  expect_equal(dim(img_data_to_mat(nifti_data_avg152T1_LR_hi)), c(91,109,91))

  # nifti_data_filtered_func
  expect_equal(dim(img_data_to_3D_mat(nifti_data_filtered_func,5)), c(64,64,21))
  expect_equal(dim(img_data_to_mat(nifti_data_filtered_func)), c(64,64,21,180))

  # nifti_data_flair
  expect_equal(dim(img_data_to_3D_mat(nifti_data_flair)), c(288,288,22))
  expect_equal(dim(img_data_to_mat(nifti_data_flair)), c(288,288,22))

  # nifti_data_JHU_MNI_SS_T1_mask
  expect_equal(dim(img_data_to_3D_mat(nifti_data_JHU_MNI_SS_T1_mask)), c(181,217,181))
  expect_equal(dim(img_data_to_mat(nifti_data_JHU_MNI_SS_T1_mask)), c(181,217,181))

  # nifti_data_MNI152_T1_1mm_brain
  expect_equal(dim(img_data_to_3D_mat(nifti_data_MNI152_T1_1mm_brain)), c(182,218,182))

  # nifti_data_roi_regToT1_SyNtoMNI
  expect_equal(dim(img_data_to_mat(nifti_data_roi_regToT1_SyNtoMNI)), c(182,218,182))

  # nifti_data_sirp
  expect_equal(dim(img_data_to_3D_mat(nifti_data_sirp,5)), c(64,64,35))
  expect_equal(dim(img_data_to_mat(nifti_data_sirp)), c(64,64,35,147))

  # nifti_data_t1
  expect_equal(dim(img_data_to_mat(nifti_data_t1)), c(512,512,22))

  # nifti_data_t1_SyNtoMNI
  expect_equal(dim(img_data_to_3D_mat(nifti_data_t1_SyNtoMNI)), c(182,218,182))

  # nifti_data_zstat1
  expect_equal(dim(img_data_to_mat(nifti_data_zstat1)), c(64,64,21))

})

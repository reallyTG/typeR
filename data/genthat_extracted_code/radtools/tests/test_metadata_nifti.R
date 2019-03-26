

test_that("NIfTI metadata", {

  # Number of slices
  expect_equal(num_slices(nifti_data_avg152T1_LR), 91)
  expect_equal(num_slices(nifti_data_avg152T1_RL), 91)
  expect_equal(num_slices(nifti_data_filtered_func), 21)
  expect_equal(num_slices(sample_nifti_img), 10)
  expect_equal(num_slices(nifti_data_zstat1), 21)

  # Number of dimensions
  expect_equal(nifti1_num_dim(nifti_data_filtered_func), 4)
  expect_equal(nifti1_num_dim(nifti_data_avg152T1_LR), 3)
  expect_equal(nifti1_num_dim(sample_nifti_img), 3)

  # Image dimensions
  expect_equal(img_dimensions(nifti_data_filtered_func), c(64, 64, 21, 180))
  expect_equal(img_dimensions(nifti_data_avg152T1_LR), c(91, 109, 91))
  expect_equal(img_dimensions(sample_nifti_img), c(64,64,10))

  # Header fields
  expect_equal(header_fields(nifti_data_avg152T1_LR), header_fields(sample_nifti_img))
  expect_equal(length(header_fields(nifti_data_zstat1)), 46)
  expect_true("slice_code" %in% header_fields(nifti_data_filtered_func))
  expect_equal(length(header_fields(sample_nifti_img)), 46)
  expect_true("srow_x" %in% header_fields(sample_nifti_img))

  # Header values
  expect_equal(header_value(nifti_data_filtered_func, "sizeof_hdr"), 348)
  expect_equal(header_value(nifti_data_filtered_func, "extender"), c(0,0,0,0))
  expect_equal(header_value(nifti_data_avg152T1_LR, "qoffset_x"), 0)
  expect_equal(header_value(nifti_data_avg152T1_LR, "descrip"), "FSL3.2beta")
  expect_equal(header_value(nifti_data_avg152T1_LR, "data_type"), "")
  expect_equal(header_value(sample_nifti_img, "cal_min"), 0)
  expect_equal(length(nifti1_header_values(sample_nifti_img)), 46)
  expect_equal(nifti1_header_values(sample_nifti_img)[["magic"]], "n+1")

  # nifti_data_1103_3
  expect_equal(num_slices(nifti_data_1103_3), 332)
  expect_equal(img_dimensions(nifti_data_1103_3), c(256, 256, 332))
  expect_equal(nifti1_num_dim(nifti_data_1103_3), 3)
  expect_equal(length(header_fields(nifti_data_1103_3)), 46)
  expect_true("qoffset_x" %in% header_fields(nifti_data_1103_3))
  expect_equal(header_value(nifti_data_1103_3, "slice_code"), 0)
  expect_equal(length(nifti1_header_values(nifti_data_1103_3)), 46)
  expect_equal(nifti1_header_values(nifti_data_1103_3)[["regular"]], "r")

  # nifti_data_1103_3_glm
  expect_equal(nifti1_num_dim(nifti_data_1103_3_glm), 3)
  expect_equal(length(header_fields(nifti_data_1103_3_glm)), 46)
  expect_true("descrip" %in% header_fields(nifti_data_1103_3_glm))
  expect_equal(header_value(nifti_data_1103_3_glm, "quatern_b"), 0)
  expect_equal(length(nifti1_header_values(nifti_data_1103_3_glm)), 46)
  expect_equal(nifti1_header_values(nifti_data_1103_3_glm)[["bitpix"]], 16)

  # nifti_data_113_01_MPRAGE
  expect_equal(num_slices(nifti_data_113_01_MPRAGE), 256)
  expect_equal(img_dimensions(nifti_data_113_01_MPRAGE), c(170,256,256))
  expect_equal(nifti1_num_dim(nifti_data_113_01_MPRAGE), 3)
  expect_equal(header_value(nifti_data_113_01_MPRAGE, "slice_code"), 0)

  # nifti_data_113_01_MPRAGE_mask
  expect_equal(num_slices(nifti_data_113_01_MPRAGE_mask), 256)
  expect_equal(img_dimensions(nifti_data_113_01_MPRAGE_mask), c(170,256,256))
  expect_equal(length(nifti1_header_values(nifti_data_113_01_MPRAGE_mask)), 46)
  expect_equal(nifti1_header_values(nifti_data_113_01_MPRAGE_mask)[["vox_offset"]], 352)

  # nifti_data_avg152T1_LR
  expect_equal(num_slices(nifti_data_avg152T1_LR), 91)
  expect_equal(img_dimensions(nifti_data_avg152T1_LR), c(91,109,91))
  expect_equal(length(header_fields(nifti_data_avg152T1_LR)), 46)
  expect_true("scl_slope" %in% header_fields(nifti_data_avg152T1_LR))
  expect_equal(header_value(nifti_data_avg152T1_LR, "cal_min"), 0)
  expect_equal(length(nifti1_header_values(nifti_data_avg152T1_LR)), 46)
  expect_equal(nifti1_header_values(nifti_data_avg152T1_LR)[["cal_min"]], 0)

  # nifti_data_avg152T1_LR_hi
  expect_equal(num_slices(nifti_data_avg152T1_LR_hi), 91)
  expect_equal(img_dimensions(nifti_data_avg152T1_LR_hi), c(91,109,91))
  expect_equal(nifti1_num_dim(nifti_data_avg152T1_LR_hi), 3)
  expect_equal(header_fields(nifti_data_avg152T1_LR_hi), header_fields(nifti_data_avg152T1_LR))
  expect_true("glmin" %in% header_fields(nifti_data_avg152T1_LR_hi))
  expect_equal(header_value(nifti_data_avg152T1_LR_hi, "glmax"), 255)
  expect_equal(length(nifti1_header_values(nifti_data_avg152T1_LR_hi)), 46)
  expect_equal(nifti1_header_values(nifti_data_avg152T1_LR_hi)[["srow_z"]], c(0,0,2,-72))

  # nifti_data_avg152T1_RL
  expect_equal(img_dimensions(nifti_data_avg152T1_RL), c(91,109,91))
  expect_equal(header_value(nifti_data_avg152T1_RL, "descrip"), "FSL3.2beta")

  # nifti_data_avg152T1_RL_hi
  expect_equal(img_dimensions(nifti_data_avg152T1_RL_hi), c(91,109,91))
  expect_equal(header_value(nifti_data_avg152T1_RL_hi, "descrip"), "FSL3.2beta")

  # nifti_data_filtered_func
  expect_equal(num_slices(nifti_data_filtered_func), 21)
  expect_equal(img_dimensions(nifti_data_filtered_func), c(64,64,21,180))
  expect_equal(nifti1_num_dim(nifti_data_filtered_func), 4)
  expect_equal(header_value(nifti_data_filtered_func, "bitpix"), 16)

  # nifti_data_flair
  expect_equal(img_dimensions(nifti_data_flair), c(288,288,22))

  # nifti_data_flair_regToT1
  expect_equal(num_slices(nifti_data_flair_regToT1), 22)
  expect_equal(img_dimensions(nifti_data_flair_regToT1), c(512,512,22))
  expect_equal(nifti1_num_dim(nifti_data_flair_regToT1), 3)
  expect_equal(length(header_fields(nifti_data_flair_regToT1)), 46)
  expect_true("intent_p3" %in% header_fields(nifti_data_flair_regToT1))
  expect_equal(header_value(nifti_data_flair_regToT1, "quatern_c"), -0.9992785, tolerance = 1e-5)
  expect_equal(length(nifti1_header_values(nifti_data_flair_regToT1)), 46)
  expect_equal(nifti1_header_values(nifti_data_flair_regToT1)[["quatern_c"]], -0.9992785, tolerance = 1e-5)

  # nifti_data_FLIRT_113_01_T2w_regToT1
  expect_equal(img_dimensions(nifti_data_FLIRT_113_01_T2w_regToT1), c(170,256,256))
  expect_equal(length(nifti1_header_values(nifti_data_FLIRT_113_01_T2w_regToT1)), 46)
  expect_equal(nifti1_header_values(nifti_data_FLIRT_113_01_T2w_regToT1)[["srow_z"]], c(0,0,1,0))

  # nifti_data_JHU_MNI_SS_T1_brain
  expect_equal(img_dimensions(nifti_data_JHU_MNI_SS_T1_brain), c(181,217,181))
  expect_equal(header_value(nifti_data_JHU_MNI_SS_T1_brain, "cal_min"), 0)

  # nifti_data_JHU_MNI_SS_T1_mask
  expect_equal(img_dimensions(nifti_data_JHU_MNI_SS_T1_mask), c(181,217,181))
  expect_equal(header_value(nifti_data_JHU_MNI_SS_T1_mask, "sform_code"), 1)

  # sample_nifti_img_hi
  expect_equal(nifti1_num_dim(nifti_data_minimal_hi), 3)
  expect_equal(header_value(nifti_data_minimal_hi, "descrip"), "")
  expect_equal(header_value(nifti_data_minimal_hi, "aux_file"), "")
  expect_equal(header_value(nifti_data_minimal_hi, "qoffset_z"), 0)
  expect_equal(nifti1_header_values(nifti_data_minimal_hi)[["quatern_c"]], 0)

  # nifti_data_MNI152_T1_1mm_brain
  expect_equal(num_slices(nifti_data_MNI152_T1_1mm_brain), 182)
  expect_equal(img_dimensions(nifti_data_MNI152_T1_1mm_brain), c(182,218,182))
  expect_equal(nifti1_num_dim(nifti_data_MNI152_T1_1mm_brain), 3)
  expect_equal(header_value(nifti_data_MNI152_T1_1mm_brain, "descrip"), "FSL3.3")

  # nifti_data_roi
  expect_equal(img_dimensions(nifti_data_roi), c(288,288,22))
  expect_equal(header_value(nifti_data_roi, "srow_z"), c(0.01915708,-0.05750556,5.98269606,-25.41534996), tolerance = 1e-5)

  # nifti_data_roi_regToT1_SyNtoMNI
  expect_equal(img_dimensions(nifti_data_roi_regToT1_SyNtoMNI), c(182,218,182))
  expect_equal(length(header_fields(nifti_data_roi_regToT1_SyNtoMNI)), 46)
  expect_true("sform_code" %in% header_fields(nifti_data_roi_regToT1_SyNtoMNI))
  expect_equal(length(nifti1_header_values(nifti_data_roi_regToT1_SyNtoMNI)), 46)
  expect_equal(nifti1_header_values(nifti_data_roi_regToT1_SyNtoMNI)[["cal_min"]], 0)

  # nifti_data_sirp
  expect_equal(num_slices(nifti_data_sirp), 35)
  expect_equal(img_dimensions(nifti_data_sirp), c(64,64,35,147))
  expect_equal(nifti1_num_dim(nifti_data_sirp), 4)
  expect_equal(header_value(nifti_data_sirp, "glmin"), 0)

  # nifti_data_t1
  expect_equal(img_dimensions(nifti_data_t1), c(512,512,22))
  expect_equal(header_value(nifti_data_t1, "xyzt_units"), 10)

  # nifti_data_t1_SyNtoMNI
  expect_equal(num_slices(nifti_data_t1_SyNtoMNI), 182)
  expect_equal(img_dimensions(nifti_data_t1_SyNtoMNI), c(182,218,182))

  # nifti_data_zstat1
  expect_equal(img_dimensions(nifti_data_zstat1), c(64,64,21))
  expect_equal(header_value(nifti_data_zstat1, "magic"), "n+1")

})


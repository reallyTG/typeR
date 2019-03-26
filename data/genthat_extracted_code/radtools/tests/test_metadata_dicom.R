
# Note: explicitly set environment variable NOT_CRAN to "true" (e.g. on command line) to run skipped tests

test_that("DICOM standard - for CRAN", {

  # DICOM standard website
  expect_true(grepl("http", dicom_standard_web()))

  # DICOM standard version
  expect_true(grepl("20", dicom_standard_version()))

  # DICOM standard timestamp
  expect_true(grepl("20", dicom_standard_timestamp()))

  # Validate header
  expect_silent(dicom_validate_keyword("PixelBandwidth"))
  expect_error(dicom_validate_keyword("xxx"))
  expect_warning(dicom_validate_keyword("xxx", stop = FALSE))
  expect_silent(dicom_validate_tag("(0008,0304)"))
  expect_error(dicom_validate_tag("(0000,0000)"))
  expect_warning(dicom_validate_tag("(0000,0000)", stop = FALSE))
  expect_silent(dicom_validate_group_element("0008", "0304"))
  expect_error(dicom_validate_group_element("0000", "0000"))
  expect_error(dicom_validate_group_element("0000", stop = FALSE))
  expect_warning(dicom_validate_group_element("0000", "0000", stop = FALSE))
  expect_error(validate_metadata(dicom_data_dclunie_scsgreek))
  expect_error(validate_metadata(dicom_data_dclunie_image))
  expect_error(validate_metadata(dicom_data_sbarre_ort))

  # Valid header elements from DICOM standard
  keywords <- dicom_all_valid_header_keywords()
  names <- dicom_all_valid_header_names()
  tags <- dicom_all_valid_header_tags()
  expect_true("MappingResourceName" %in% keywords)
  expect_true("Equipment Modality" %in% names)
  expect_true("(0008,030E)" %in% tags)

  # DICOM header tag
  expect_error(dicom_header_tag("1111"))
  expect_error(dicom_header_tag("1111", "xxxx"))
  expect_error(dicom_header_tag("xxxx", "1111"))
  expect_equal(dicom_header_tag("0000", "1111"), "(0000,1111)")

  # Search keyword
  res_kw <- dicom_search_header_keywords("width")
  res_name <- dicom_search_header_names("width")
  expect_true("ChannelWidth" %in% res_kw)
  expect_true("Channel Width" %in% res_name)
  expect_equal(length(dicom_search_header_names("xxxxx")), 0)
  expect_equal(length(dicom_search_header_names("xxxxx")), 0)

})

test_that("DICOM header as matrix - for CRAN", {
  expect_equal(ncol(dicom_header_as_matrix(sample_dicom_img)), 7)
  expect_error(dicom_header_as_matrix(dicom_data_sbarre_heart_mr, 2))
  expect_equal(ncol(dicom_header_as_matrix(dicom_data_sbarre_heart_mr)), 5)
  expect_equal(ncol(dicom_header_as_matrix(dicom_data_sbarre_heart_nm)), 5)
  expect_equal(ncol(dicom_header_as_matrix(dicom_data_sbarre_execho)), 5)
  expect_equal(ncol(dicom_header_as_matrix(dicom_data_sbarre_ort)), 5)
  expect_equal(ncol(dicom_header_as_matrix(dicom_data_sbarre_brain)), 5)
  expect_equal(ncol(dicom_header_as_matrix(dicom_data_dclunie_scsgreek)), 5)
  expect_equal(ncol(dicom_header_as_matrix(dicom_data_dclunie_image)), 5)
  expect_equal(ncol(dicom_header_as_matrix(sample_dicom_img)), 7)
})

test_that("Number of slices - for CRAN", {
  expect_equal(num_slices(sample_dicom_img), 3)
  expect_equal(num_slices(dicom_data_sbarre_ort), 1)
  expect_equal(num_slices(dicom_data_sbarre_heart_mr), 1)
  expect_equal(num_slices(dicom_data_sbarre_heart_nm), 1)
  expect_equal(num_slices(dicom_data_sbarre_execho), 1)
  expect_equal(num_slices(dicom_data_sbarre_brain), 1)
  expect_equal(num_slices(dicom_data_sbarre_knee), 1)
  expect_equal(num_slices(dicom_data_sbarre_head), 1)
  expect_equal(num_slices(dicom_data_dclunie_scsgreek), 1)
  expect_equal(num_slices(dicom_data_dclunie_image), 1)
  expect_equal(num_slices(sample_dicom_img), 3)
})

test_that("Image dimensions - for CRAN", {
  expect_equal(img_dimensions(sample_dicom_img), c(256, 256, 3))
  expect_equal(img_dimensions(dicom_data_sbarre_brain), c(512, 512, 1))
  expect_error(img_dimensions(dicom_data_sbarre_ort))
  expect_error(img_dimensions(dicom_data_sbarre_knee))
  expect_error(img_dimensions(dicom_data_sbarre_head))
  expect_error(img_dimensions(dicom_data_sbarre_execho))
  expect_error(img_dimensions(dicom_data_dclunie_scsgreek))
  expect_error(img_dimensions(dicom_data_dclunie_image))
  expect_equal(img_dimensions(sample_dicom_img), c(256, 256, 3))
})

test_that("DICOM header fields - for CRAN", {
  expect_true("SpecificCharacterSet" %in% header_fields(sample_dicom_img))
  expect_true("StudyInstanceUID" %in% header_fields(dicom_data_dclunie_scsgreek))
  expect_true("StudyInstanceUID" %in% header_fields(dicom_data_dclunie_image))
  expect_true("SliceThickness" %in% header_fields(dicom_data_sbarre_heart_nm))
  expect_true("Manufacturer" %in% header_fields(dicom_data_sbarre_head))
  expect_true("SpecificCharacterSet" %in% header_fields(sample_dicom_img))
})

test_that("DICOM header values - for CRAN", {
  expect_equal(header_value(sample_dicom_img, "InstanceCreatorUID")[[1]], "1.3.6.1.4.1.5962.3")
  expect_equal(header_value(sample_dicom_img, "GroupLength")[[3]], 192)
  expect_equal(header_value(dicom_data_sbarre_brain, "SliceThickness"), 10.0)
  expect_equal(header_value(dicom_data_sbarre_head, "SpatialResolution"), "1.145833 0.859375")
  expect_equal(header_value(dicom_data_sbarre_knee, "HighBit"), 15)
  expect_equal(header_value(dicom_data_sbarre_ort, "PhotometricInterpretation"), "MONOCHROME2")
  expect_equal(header_value(dicom_data_sbarre_heart_mr, "NumberOfFrames"), 16)
  expect_equal(header_value(dicom_data_sbarre_heart_nm, "NumberOfFrames"), 13)
  expect_equal(header_value(dicom_data_sbarre_execho, "NumberOfFrames"), 8)
  expect_equal(header_value(dicom_data_dclunie_scsgreek, "InstanceNumber"), 1)
  expect_equal(header_value(dicom_data_dclunie_scsgreek, "PhotometricInterpretation"), "MONOCHROME2")
  expect_equal(header_value(sample_dicom_img, "InstanceCreatorUID")[[1]], "1.3.6.1.4.1.5962.3")
  expect_equal(header_value(sample_dicom_img, "GroupLength")[[3]], 192)
})

test_that("Constant header values - for CRAN", {
  expect_equal(dicom_constant_header_values(sample_dicom_img)[["StudyDate"]], 20030505)
  expect_equal(length(dicom_constant_header_values(dicom_data_sbarre_ort)), length(header_fields(dicom_data_sbarre_ort)))
  expect_equal(length(dicom_constant_header_values(dicom_data_sbarre_ort)), nrow(dicom_header_as_matrix(dicom_data_sbarre_ort)) - 6) # GroupLength is included 6 times
  expect_equal(length(dicom_constant_header_values(dicom_data_sbarre_heart_mr)), length(header_fields(dicom_data_sbarre_heart_mr)))
  expect_equal(length(dicom_constant_header_values(dicom_data_sbarre_heart_nm)), length(header_fields(dicom_data_sbarre_heart_nm)))
  expect_equal(length(dicom_constant_header_values(dicom_data_sbarre_execho)), length(header_fields(dicom_data_sbarre_execho)))
  expect_equal(length(dicom_constant_header_values(dicom_data_dclunie_scsgreek)), length(header_fields(dicom_data_dclunie_scsgreek)))
  expect_equal(length(dicom_constant_header_values(dicom_data_dclunie_scsgreek)), nrow(dicom_header_as_matrix(dicom_data_dclunie_scsgreek)))
  expect_equal(length(dicom_constant_header_values(dicom_data_dclunie_image)), length(header_fields(dicom_data_dclunie_image)))
  expect_equal(length(dicom_constant_header_values(dicom_data_dclunie_image)), nrow(dicom_header_as_matrix(dicom_data_dclunie_image)))
})



test_that("DICOM metadata not run on CRAN", {

  skip_on_cran()

  # Number of slices
  expect_equal(num_slices(dicom_data_qin_hn_sr), 0)
  expect_equal(num_slices(dicom_data_prostate_mr), 19)
  expect_equal(num_slices(dicom_data_bladder), 1)
  expect_equal(num_slices(dicom_data_chest), 128)
  expect_equal(num_slices(dicom_data_prostate_pt), 234)
  expect_equal(num_slices(dicom_data_988_MR700), 12)
  expect_equal(num_slices(dicom_data_247_MR3), 24)
  expect_equal(num_slices(dicom_data_247_OT), 1)

  # Image dimensions
  expect_equal(img_dimensions(dicom_data_qin_hn_sr), NA)
  expect_error(img_dimensions(dicom_data_bladder))
  expect_equal(img_dimensions(dicom_data_prostate_mr), c(384, 384, 19))
  expect_equal(img_dimensions(dicom_data_988_MR700), c(512, 512, 12))
  expect_error(img_dimensions(dicom_data_247_OT))

  # DICOM header fields
  fieldsp <- header_fields(dicom_data_prostate_mr)
  expect_equal(length(fieldsp), 111)
  expect_true("DeidentificationMethod" %in% fieldsp)
  expect_true(!"xxx" %in% fieldsp)
  fieldsc <- header_fields(dicom_data_chest)
  expect_equal(length(fieldsc), 94)
  expect_true("BodyPartExamined" %in% fieldsc)
  expect_true(!"Unknown" %in% fieldsc)
  expect_true("SOPClassUID" %in% header_fields(dicom_data_988_MR700))
  expect_true("AcquisitionMatrix" %in% header_fields(dicom_data_247_MR3))
  expect_true("InstanceCreationDate" %in% header_fields(dicom_data_247_OT))

  # Validate header
  expect_error(validate_metadata(dicom_data_prostate_mr))
  expect_error(validate_metadata(dicom_data_bladder))
  expect_silent(validate_metadata(dicom_data_qin_hn_sr, stop = FALSE))

  # DICOM header values
  slice_idx <- 5
  field_idx <- 100
  field <- dicom_data_prostate_mr$hdr[[slice_idx]]$name[[field_idx]]
  value <- as.numeric(dicom_data_prostate_mr$hdr[[slice_idx]]$value[[field_idx]])
  expect_equal(header_value(dicom_data_prostate_mr, field)[[slice_idx]], value)
  expect_equal(header_value(dicom_data_prostate_mr, "PixelBandwidth"), rep(200, 19))
  expect_error(header_value(dicom_data_prostate_mr, "xxx"))
  fieldb <- dicom_data_bladder$hdr[[1]]$name[[field_idx]]
  valb <- as.numeric(dicom_data_bladder$hdr[[1]]$value[[field_idx]])
  expect_equal(header_value(dicom_data_bladder, fieldb)[[1]], valb)
  expect_equal(header_value(dicom_data_bladder, "SeriesDate"), 20020816)
  expect_error(header_value(dicom_data_bladder, "Unknown"))
  fieldp <- dicom_data_prostate_pt$hdr[[slice_idx]]$name[[field_idx]]
  valp <- as.numeric(dicom_data_prostate_pt$hdr[[slice_idx]]$value[[field_idx]])
  expect_equal(header_value(dicom_data_prostate_pt, fieldp)[[slice_idx]], valp)
  expect_equal(header_value(dicom_data_prostate_pt, "GroupLength"), rep(196,234))
  expect_error(header_value(dicom_data_prostate_pt, "Unknown"))
  expect_equal(header_value(dicom_data_prostate_mr, "Manufacturer")[[slice_idx]], "SIEMENS")
  expect_equal(header_value(dicom_data_988_MR700, "MediaStorageSOPInstanceUID")[[2]], "1.3.6.1.4.1.5962.1.1.0.0.0.1196533885.18148.0.120")
  expect_equal(header_value(dicom_data_247_MR3, "ContentTime")[[1]], 1413.094)
  expect_equal(header_value(dicom_data_247_OT, "ImageType"), "DERIVED SECONDARY")

  # DICOM header as matrix
  mat1 <- dicom_header_as_matrix(dicom_data_prostate_mr, 1)
  expect_equal(ncol(mat1), 7)
  expect_gt(nrow(mat1), 100)
  expect_gt(nrow(mat1 %>% dplyr::filter(name == "CodeMeaning")), 1)
  mat <- dicom_header_as_matrix(dicom_data_prostate_mr)
  expect_equal(ncol(mat), 23)
  expect_gt(nrow(mat1), nrow(mat))
  expect_equal(nrow(mat %>% dplyr::filter(name == "CodeMeaning")), 0)
  v1 <- mat %>% dplyr::filter(name == "InstanceCreationTime") %>% dplyr::select("slice_2")
  expect_equal(v1[1,1], "091612.484000")
  expect_equal(nrow(mat), nrow(mat %>% dplyr::select(group, element, name) %>% unique()))
  mat1b <- dicom_header_as_matrix(dicom_data_bladder, 1)
  matb <- dicom_header_as_matrix(dicom_data_bladder)
  expect_equal(nrow(mat1b %>% dplyr::filter(name == "CodeMeaning")), 7)
  expect_equal(nrow(matb %>% dplyr::filter(name == "CodeMeaning")), 0)
  expect(ncol(matb %>% dplyr::select(dplyr::starts_with("slice"))), 1)
  mat10c <- dicom_header_as_matrix(dicom_data_chest, 10)
  matc <- dicom_header_as_matrix(dicom_data_chest)
  expect(ncol(matc %>% dplyr::select(dplyr::starts_with("slice"))), 128)
  expect_equal(mat10c[9,6], "ORIGINAL PRIMARY AXIAL")
  expect_silent(dicom_header_as_matrix(dicom_data_qin_hn_sr))
  expect_equal(ncol(dicom_header_as_matrix(dicom_data_988_MR700)), 16)
  expect_equal(ncol(dicom_header_as_matrix(dicom_data_247_MR3)), 28)
  expect_equal(ncol(dicom_header_as_matrix(dicom_data_247_OT)), 5)

  # Constant header values
  const_val <- dicom_constant_header_values(dicom_data_prostate_mr)
  expect_null(const_val[["Unknown"]])
  expect_equal(const_val[["GroupLength"]], 196)
  expect_equal(dicom_constant_header_values(dicom_data_prostate_mr, numeric = FALSE)[["GroupLength"]], "196")
  expect_null(const_val[["SliceLocation"]])
  expect_equal(dicom_constant_header_values(dicom_data_988_MR700)[["GroupLength"]], 194)
  expect_equal(dicom_constant_header_values(dicom_data_247_MR3)[["DerivationDescription"]], "DRS:DOE, HARRY    24759123  1 01 01  3   JPEG  2   3  1  90")
  expect_equal(dicom_constant_header_values(dicom_data_247_OT)[["DerivationDescription"]], "DRS:DOE, HARRY    24759123  1 01 01  3   JPEG  2   3  1  90")

  const_valb <- dicom_constant_header_values(dicom_data_bladder)
  expect_equal(length(const_valb),
               nrow(
                 dicom_header_as_matrix(dicom_data_bladder) %>%
                   dplyr::group_by(name) %>%
                   dplyr::summarize(n = n()) %>%
                   dplyr::filter(n == 1)))
  expect_equal(const_valb$AcquisitionDate, 20020816)
  expect_equal(dicom_constant_header_values(dicom_data_bladder, numeric = F)[["AcquisitionDate"]], "20020816")

  const_valc <- dicom_constant_header_values(dicom_data_chest)
  expect_null(const_valc[["Unknown"]])
  expect_equal(const_valc[["StudyDate"]], 20000101)
  expect_equal(dicom_constant_header_values(dicom_data_chest, numeric = FALSE)[["SeriesDate"]], "20000101")
  expect_null(const_valc[["SliceLocation"]])


})


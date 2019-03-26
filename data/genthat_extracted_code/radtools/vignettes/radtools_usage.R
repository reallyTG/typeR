## ----setup, include = FALSE----------------------------------------------
suppressPackageStartupMessages(library(knitr))
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)

## ----suppress_eval, echo = FALSE-----------------------------------------
# Check if this is running locally and if not, suppress evaluation
if(!utils::file_test("-f", "~/Dropbox/radtools_vignette_data/prostate/000008.dcm")) {
  knitr::opts_chunk$set(eval = FALSE)
  message("Note: code examples will not be evaluated because they depend on local data.")
}

## ----import_package, warning = FALSE-------------------------------------
library(radtools)

## ----read_dicom_single_file----------------------------------------------
dicom_data_2d <- read_dicom("~/Dropbox/radtools_vignette_data/prostate/000008.dcm")
names(dicom_data_2d)

## ----read_dicom_dir------------------------------------------------------
dicom_data_3d <- read_dicom("~/Dropbox/radtools_vignette_data/prostate/")
names(dicom_data_3d)

## ----read_nifti_3d-------------------------------------------------------
nifti_data_3d <- read_nifti1("~/Dropbox/radtools_vignette_data/avg152T1_LR_nifti")

## ----read_nifti_4d-------------------------------------------------------
nifti_data_4d <- read_nifti1("~/Dropbox/radtools_vignette_data/filtered_func_data.nii.gz")

## ----img_dim-------------------------------------------------------------
img_dimensions(dicom_data_2d)
num_slices(dicom_data_2d)
img_dimensions(dicom_data_3d)
num_slices(dicom_data_3d)
img_dimensions(nifti_data_3d)
num_slices(nifti_data_3d)
img_dimensions(nifti_data_4d)
num_slices(nifti_data_4d)

## ----header_fields-------------------------------------------------------
header_fields_dicom <- header_fields(dicom_data_3d)
head(header_fields_dicom)
header_fields(nifti_data_3d)

## ----header_value--------------------------------------------------------
header_value(dicom_data_2d, "SliceLocation")
header_value(dicom_data_3d, "SliceLocation")
header_value(nifti_data_3d, "dim_")
header_value(nifti_data_4d, "dim_")

## ----dicom_header_as_mat, warning = FALSE--------------------------------
dicom_metadata_matrix <- dicom_header_as_matrix(dicom_data_3d)
kable(dicom_metadata_matrix[1:10, 1:6])

## ----dicom_const---------------------------------------------------------
const_attributes <- dicom_constant_header_values(dicom_data_3d)
head(const_attributes)

## ----nifti_dim-----------------------------------------------------------
nifti1_num_dim(nifti_data_3d)
nifti1_num_dim(nifti_data_4d)

## ----nifti_header_val----------------------------------------------------
nifti_header_vals <- nifti1_header_values(nifti_data_4d)
# Display the first few metadata values other than the image itself
head(nifti_header_vals[names(nifti_header_vals) != ".Data"])

## ----img_data_to_mat-----------------------------------------------------
mat_dicom_2d <- img_data_to_mat(dicom_data_2d)
dim(mat_dicom_2d)
mat_dicom_3d <- img_data_to_mat(dicom_data_3d)
dim(mat_dicom_3d)
mat_nifti_3d <- img_data_to_mat(nifti_data_3d)
dim(mat_nifti_3d)
mat_nifti_4d <- img_data_to_mat(nifti_data_4d)
dim(mat_nifti_4d)

## ----img_data_to_3d_mat--------------------------------------------------
mat_nifti_4d_to_3d <- img_data_to_3D_mat(nifti_data_4d, coord_extra_dim = 90)
dim(mat_nifti_4d_to_3d)

## ----view_slice_single, fig.width = 5, fig.height = 5--------------------
view_slice(dicom_data_2d)

## ----view_slice_dir, warning = FALSE, fig.width = 5, fig.height = 5------
view_slice(dicom_data_3d, slice = 10)
view_slice(nifti_data_3d, slice = 20)

## ----view_slice_mat, fig.width = 5, fig.height = 5-----------------------
view_slice_mat(mat_nifti_4d_to_3d, slice = 10)

## ----dicom_standard_version----------------------------------------------
dicom_standard_version()
dicom_standard_web()
dicom_standard_timestamp()

## ----tags----------------------------------------------------------------
tags <- dicom_all_valid_header_tags()
length(tags)
head(tags, 10)

## ----names---------------------------------------------------------------
names <- dicom_all_valid_header_names()
length(names)
head(names, 10)

## ----keywords------------------------------------------------------------
keywords <- dicom_all_valid_header_keywords()
length(keywords)
head(keywords, 10)

## ----dicom_std_search----------------------------------------------------
dicom_search_header_names("manufacturer")
dicom_search_header_keywords("manufacturer")

## ----session_info--------------------------------------------------------
sessionInfo()


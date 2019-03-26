library(radtools)


### Name: header_value
### Title: Get metadata contained in a header field
### Aliases: header_value

### ** Examples

data(sample_dicom_img)
data(sample_nifti_img)
header_value(sample_dicom_img, "SliceLocation")
header_value(sample_nifti_img, "dim_")




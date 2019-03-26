
# Note: explicitly set environment variable NOT_CRAN to "true" (e.g. on command line) to run skipped tests


# Make temp directory to store images from web
outdir_dicom <- xfun::normalize_path(tempdir(check = TRUE))
dir.create(outdir_dicom, recursive = TRUE)


# Images from http://barre.nom.fr/medical/samples/
# This repository collects DICOM files for testing purposes.
url_sbarre <- "http://barre.nom.fr/medical/samples/files/"
sbarre_samples <- list(ort = "CT-MONO2-16-ort",
                       brain = "CT-MONO2-16-brain",
                       head = "MR-MONO2-16-head",
                       knee = "MR-MONO2-16-knee",
                       heart_mr = "MR-MONO2-8-16x-heart",
                       heart_nm = "NM-MONO2-16-13x-heart",
                       execho = "US-MONO2-8-8x-execho")
sbarre_url_sample <- function(sample) {paste(url_sbarre, sample, ".gz", sep = "")}
sbarre_unzip_file <- function(sample) {xfun::normalize_path(file.path(outdir_dicom, sample))}
sbarre_zip_file <- function(sample) {paste(sbarre_unzip_file(sample), ".gz", sep = "")}
for(sample in sbarre_samples) {
  download.file(sbarre_url_sample(sample), sbarre_zip_file(sample))
  R.utils::gunzip(sbarre_zip_file(sample))
}

# dicom_data_sbarre_ort
# - DICOM
# - Implicit Little
# - CT
# - MONOCHROME2
# - 512x512
# - [16, 16 | 15], PR=1
# - G.E. Med. Syst.
# - HiSpeed CT/i
# Aspects tested:
# - Has a single slice
# - GroupLength is included in header multiple times
# - Has an invalid DICOM header according to current standard
# - Can't make 3D matrix with single slice
# - Test specific header values
# - Dimensions of metadata matrix
dicom_data_sbarre_ort <- read_dicom(sbarre_unzip_file(sbarre_samples$ort))

# dicom_data_sbarre_brain
# - DICOM
# - Explicit Little
# - CT
# - MONOCHROME2
# - 512x512
# - [16, 16 | 15], PR=1
# - Picker Int., Inc.
# - PQ5000
# Aspects tested:
# - Has a single slice
# - Dimensions are 512x512x1
# - Slice thickness
# - Dimensions of metadata matrix
# - View slice of 2D image
dicom_data_sbarre_brain <- read_dicom(sbarre_unzip_file(sbarre_samples$brain))

# dicom_data_sbarre_head
# - DICOM
# - Implicit Little
# - MR
# - MONOCHROME2
# - 256x256
# - [16, 16 | 15], PR=1
# - G.E. Med. Syst.
# - Genesis Signal (04)
# Aspects tested:
# - Has a single slice
# - Spatial resolution
# - Manufacturer
dicom_data_sbarre_head <- read_dicom(sbarre_unzip_file(sbarre_samples$head))

# dicom_data_sbarre_knee
# - DICOM
# - Implicit Little
# - MR
# - MONOCHROME2
# - 256x256
# - [16, 16 | 15], PR=1
# - G.E. Med. Syst.
# - Genesis Signal (04)
# Aspects tested:
# - Has a single slice
# - Specific metadata values
dicom_data_sbarre_knee <- read_dicom(sbarre_unzip_file(sbarre_samples$knee))

# dicom_data_sbarre_heart_mr
# - A 3D DICOM image stored in a single file instead of one slice per file
# - DICOM
# - Explicit Little
# - MR
# - MONOCHROME2
# - 16x256x256
# - [8, 8 | 7]
# - Philips
# - Multiple slices are in a single image file
# Aspects tested:
# - Number of frames (16)
# - Set of header fields
# - dicom_header_as_matrix can't specify slice if multiple slices in single image file
# - Dimensions of metadata matrix
# - Conversion to 3D matrix fails due to missing header fields ImagePositionPatient, ImageOrientationPatient
dicom_data_sbarre_heart_mr <- read_dicom(sbarre_unzip_file(sbarre_samples$heart_mr))

# dicom_data_sbarre_heart_nm
# - DICOM
# - Explicit Little
# - NM
# - MONOCHROME2
# - 13x64x64
# - [16, 16 | 15]
# - Acme Products
# - (6.1.0 1.0)
# Aspects tested:
# - Slice thickness
# - Number of frames (13)
# - Set of header fields
# - Conversion to 3D matrix fails due to missing header fields ImagePositionPatient, ImageOrientationPatient
dicom_data_sbarre_heart_nm <- read_dicom(sbarre_unzip_file(sbarre_samples$heart_nm))

# dicom_data_sbarre_execho
# - DICOM
# - Explicit Little
# - US
# - MONOCHROME2
# - 8x128x120
# - [8, 8 | 7]
# - Acme Products
# Aspects tested:
# - Number of frames
# - Set of header fields
# - Some calculations fail due to missing header fields ImagePositionPatient, ImageOrientationPatient
dicom_data_sbarre_execho <- read_dicom(sbarre_unzip_file(sbarre_samples$execho))


# Function to expand a .tar.bz2 archive
expand_tar_bz2 <- function(file, outdir) {
  tar <- xfun::normalize_path(R.utils::bunzip2(file))
  untar(tar, exdir = outdir)
}


# Images from http://www.dclunie.com/
# David Clunie's Medical Image Format Site
d_clunie_tar_charset <- xfun::normalize_path(file.path(outdir_dicom, "charsettests.20070405.tar.bz2"))
d_clunie_tar_deflate <- xfun::normalize_path(file.path(outdir_dicom, "deflate_tests_release.tar.gz"))
d_clunie_tar_signedrange <- xfun::normalize_path(file.path(outdir_dicom, "signedrangeimages.tar.bz2"))
download.file("http://www.dclunie.com/images/charset/charsettests.20070405.tar.bz2", d_clunie_tar_charset)
download.file("http://www.dclunie.com/images/compressed/deflate_tests_release.tar.gz", d_clunie_tar_deflate)
download.file("http://www.dclunie.com/images/signedrange/signedrangeimages.tar.bz2", d_clunie_tar_signedrange)
untar(d_clunie_tar_deflate, exdir = outdir_dicom)
expand_tar_bz2(d_clunie_tar_charset, outdir_dicom)
expand_tar_bz2(d_clunie_tar_signedrange, outdir_dicom)
dir_d_clunie_dicom_deflate <- xfun::normalize_path(file.path(outdir_dicom, "deflate_tests"))
dir_d_clunie_dicom_charset <- xfun::normalize_path(file.path(outdir_dicom, "charsettests"))
dir_d_clunie_dicom_signedrange <- xfun::normalize_path(file.path(outdir_dicom, "IMAGES"))


# For debugging
print_dir <- function(dir) {
  print("")
  print(dir)
  print(list.files(dir, recursive = TRUE, full.names = TRUE, include.dirs = TRUE))
}
#print_dir(outdir_dicom)
#print_dir(dir_d_clunie_dicom_deflate)
#print_dir(dir_d_clunie_dicom_charset)
#print_dir(dir_d_clunie_dicom_signedrange)


# dicom_data_dclunie_scsgreek
# - Single slice DICOM dataset with Greek characters
# Aspects tested:
# - Some calculations fail due to missing header fields ImagePositionPatient, ImageOrientationPatient
# - Dimensions of metadata table
# - Single slice
# - Specific header fields and values
# - Set of header fields
dicom_data_dclunie_scsgreek <- read_dicom(xfun::normalize_path(file.path(dir_d_clunie_dicom_charset, "SCSGREEK")))

# Aspects tested:
# - Some calculations fail due to missing header fields ImagePositionPatient, ImageOrientationPatient
dicom_data_dclunie_scsx2 <- read_dicom(xfun::normalize_path(file.path(dir_d_clunie_dicom_charset, "SCSX2")))

# dicom_data_dclunie_image
# - Deflate transfer syntax
# Aspects tested:
# - Has single slice
# - Set of header fields
# - Metadata matrix
# - Has invalid metadata according to current DICOM standard
# - Study instance UID
# - Some calculations fail due to missing header fields ImagePositionPatient, ImageOrientationPatient
dicom_data_dclunie_image <- read_dicom(xfun::normalize_path(file.path(dir_d_clunie_dicom_deflate, "image")))


# TCIA datasets can't be downloaded on the fly
# PCIR datasets take a long time to download, so skip them on CRAN
if(identical(tolower(Sys.getenv("NOT_CRAN")), "true")) {

  # dicom_data_qin_hn_sr
  # - Series 1.2.276.0.7230010.3.1.3.8323329.18438.1440001309.981882 from TCIA
  # - A DICOM SR object with no slices
  # Aspects tested:
  # - Can support SR object
  # - Number of slices is 0
  # - Image dimensions is NA
  # - Validate metadata option to print issues but not stop executionj
  # - Can get metadata matrix without error
  # - Error when trying to get image data as matrix
  # - Error when trying to view slice
  dir_qin_headneck_sr <- "~/Dropbox/Documents/Radiogenomics/radiogenomics_r_package/sample_data/images/dicom/qin_headneck_sr"
  dicom_data_qin_hn_sr <- read_dicom(xfun::normalize_path(file.path(dir_qin_headneck_sr, "1-234.dcm")))

  # dicom_data_prostate_mr
  # - NCI ISBI prostate challenge
  # - Modality: MR
  # - Body part: prostate
  # - Manufacturer: Siemens
  # Aspects tested:
  # - Number of slices is 19
  # - Image dimensions are 384x384x19
  # - Headers have 111 different fields
  # - Specific header fields are present or not present
  # - Metadata does not technically conform to current DICOM standard
  # - Header value is a list with values in correct order
  # - Header value for constant numeric value is list with repeated numeric values
  # - Error when trying to retrieve header value for field that doesn't exist
  # - Header value for manufacturer is list of strings with value SIEMENS
  # - Getting metadata matrix for an optional single slice
  #    - Has expected number of rows, one for each field
  #    - CodeMeaning is repeated field
  # - Full metadata matrix has 23 columns
  # - Full metadata matrix does not contain repeated fields
  # - Full metadata matrix has expected column names e.g. "slice_2"
  # - Full metadata matrix elements have expected type
  # - List of header values constant across slices
  #    - Repeated header value is absent
  #    - Specific values and their types
  #    - Option to encode numeric values as strings works correctly
  # - Dimensions of matrix are 384x384x19
  # - Dimensions of 3D matrix are 384x384x19
  # - View slice 5
  # - View slice 10 of 3D intensity matrix
  # - Error when trying to view slice number that is out of bounds
  # - Error when trying to view slice of 3D intensity matrix that is out of bounds
  dir_prostate_dicom_mr <- "~/Dropbox/Documents/Radiogenomics/radiogenomics_r_package/sample_data/images/dicom/nci_isbi_2013_challenge_prostate/images_dicom/"
  dir_prostate_dicom_mr <-
    xfun::normalize_path(file.path(dir_prostate_dicom_mr,
          "Prostate3T-03-0001/1.3.6.1.4.1.14519.5.2.1.7307.2101.182382809090179976301292139745/1.3.6.1.4.1.14519.5.2.1.7307.2101.287009217605941401146066177219"))
  dicom_data_prostate_mr <- read_dicom(dir_prostate_dicom_mr)

  # dicom_data_chest
  # - LIDC-IDRI
  # - TCIA series instance UID 1.3.6.1.4.1.14519.5.2.1.6279.6001.140253591510022414496468423138
  # - Modality: CT
  # - Body part: chest
  # - Manufacturer: GE Medical Systems
  # Aspects tested:
  # - Number of slices is 128
  # - Set of header fields has length 94, contains expected values and does not contain unexpected values
  # - Full metdata matrix: number of columns that start with "slice" is 128
  # - Metadata matrix for a single slice: expected entries in matrix
  # - Constant header values across slices
  #    - Repeated fields are omitted
  #    - Numeric values are rendered as numeric
  #    - Option to return numeric values as strings works
  # - Dimensions of image matrix and 3D matrix are 512x512x128
  # - When converting image data to 3D matrix, can't use option to hold additional dimensions constant because there are no additional dimensions
  dir_chest_dicom <- "~/Dropbox/Documents/Radiogenomics/radiogenomics_r_package/sample_data/images/dicom/lidc_idri_chest_ct/1.3.6.1.4.1.14519.5.2.1.6279.6001.140253591510022414496468423138"
  dicom_data_chest <- read_dicom(dir_chest_dicom)

  # dicom_data_prostate_pt
  # - NaF Prostate
  # - TCIA series instance UID 1.3.6.1.4.1.14519.5.2.1.9823.8001.580231868964887648671150773545
  # - Modality: PET
  # - Body part: Prostate
  # - Manufacturer: Philips Medical Systems
  # Aspects tested:
  # - Number of slices is 234
  # - Header values is list with values in correct order
  # - Header values for constant numeric value across slices is list of repeated numeric value
  # - Trying to get header value for repeated field throws error
  # - Dimensions of image matrix and 3D matrix are 144x144x234
  dir_prostate_pt_dicom <- "~/Dropbox/Documents/Radiogenomics/radiogenomics_r_package/sample_data/images/dicom/naf_prostate_pt/1.3.6.1.4.1.14519.5.2.1.9823.8001.580231868964887648671150773545"
  dicom_data_prostate_pt <- read_dicom(dir_prostate_pt_dicom)

  # dicom_data_bladder
  # - TCIA image with a single slice
  # - TCGA-BLCA
  # - TCIA series instance UID 1.3.6.1.4.1.14519.5.2.1.8421.4016.922520924373492766630626617012
  # - Modality: CR
  # - Body part: bladder
  # - Manufacturer: Fujifilm
  # Aspects tested:
  # - Number of slices is 1
  # - Some calculations fail due to missing fields ImagePositionPatient and ImageOrientationPatient
  # - Metadata does not conform to current DICOM standard
  # - Header values is list with one element; values are correct
  # - Trying to get header value for repeated field throws error
  # - Metadata matrix for specific slice includes repeated fields
  # - Metadata matrix for all slices does not include repeated fields despite this dataset having one slice
  # - Metadata matrix has a single column starting with "slice"
  # - List of constant header values has same names as unique fields in metadata matrix because only one slice
  # - Getting constant header values: option to return all values as strings works correctly
  dir_bladder_dicom <- "~/Dropbox/Documents/Radiogenomics/radiogenomics_r_package/sample_data/images/dicom/tcga_blca_cr/1.3.6.1.4.1.14519.5.2.1.8421.4016.922520924373492766630626617012"
  dicom_data_bladder <- read_dicom(dir_bladder_dicom)

  # Images from patient contributed image repository http://www.pcir.org/
  pcir_tar_988 <- paste(outdir_dicom, "98890234_20030505_MR.tar.bz2", sep = "")
  pcir_tar_247 <- paste(outdir_dicom, "24759123_20010101.tar.bz2", sep = "")
  download.file("https://archive.org/download/9889023420030505MR/98890234_20030505_MR.tar.bz2", pcir_tar_988)
  download.file("https://archive.org/download/2475912320010101/24759123_20010101.tar.bz2", pcir_tar_247)
  expand_tar_bz2(pcir_tar_988, outdir_dicom)
  expand_tar_bz2(pcir_tar_247, outdir_dicom)
  # 98890234_20030505_MR
  # MR, MRA, DWI of Brain, Carotids
  dir_pcir_988 <- xfun::normalize_path(file.path(outdir_dicom, "98890234/20030505/MR/"))
  # 24759123_20010101
  # Patient contributed DICOM images - MR, MRA, DWI of Brain, Carotids
  dir_pcir_247 <- xfun::normalize_path(file.path(outdir_dicom, "24759123/20010101/"))
  #print_dir(dir_pcir_988)
  #print_dir(dir_pcir_247)

  # dicom_data_988_MR700
  # Aspects tested:
  # - Has 12 slices
  # - Dimensions of metadata matrix
  # - Image dimensions 512x512x12
  # - SOP class UID
  # - MediaStorageSOPInstanceUID is a list
  # - Constant header values across slices is a list; specific constant values
  # - Constant header value list elements have appropriate type
  # - Metadata matrix dimensions
  # - Convert image data to 3D matrix; correct dimensions
  # - When converting image data to 3D matrix, can't use option to hold additional dimensions constant because there are no additional dimensions
  dicom_data_988_MR700 <- read_dicom(xfun::normalize_path(file.path(dir_pcir_988, "MR700")))


  # dicom_data_247_MR3
  # - A DICOM image with 24 slices, where image file dimensions do not match Rows and Columns attributes in DICOM metadata
  # Aspects tested:
  # - Can make 3D matrix despite discrepancy in image dimension attributes; code raises a warning in this case
  # - Has 24 slices
  # - Constant header values across slices: a list with names = the header names; specific values
  # - Constant header values list elements have appropriate type
  # - Header value is a list with one entry per slice; specific values
  # - Header value list elements have appropriate type e.g. numeric
  # - Metadata matrix has 28 columns
  # - Set of header fields
  # - When converting image data to 3D matrix, can't use option to hold additional dimensions constant because there are no additional dimensions
  dicom_data_247_MR3 <- read_dicom(xfun::normalize_path(file.path(dir_pcir_247, "MR3")))

  # dicom_data_247_OT
  # -
  # Aspects tested:
  # - Header value for image type
  # - Value for DerivationDescription is constant across slices and has appropriate type when retrieved
  # - Has a single slice
  # - Metadata matrix dimensions
  # - Set of header fields; specific fields are present
  # - Some calculations fail due to missing fields ImagePositionPatient and ImageOrientationPatient
  dicom_data_247_OT <- read_dicom(xfun::normalize_path(file.path(dir_pcir_247, "OT999999")))

}

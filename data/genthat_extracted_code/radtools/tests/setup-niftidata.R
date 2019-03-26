

# Make temp directory to store images from web
outdir_nifti <- tempdir(check = TRUE)
dir.create(outdir_nifti, recursive = TRUE)



# NIMH NIfTI-1 test datasets
# Valid test data sets of 3D (structural) and 4D (functional) images in NIfTI-1 format.
# https://nifti.nimh.nih.gov/nifti-1/data
url_nimh <- "https://nifti.nimh.nih.gov/nifti-1/data/"
download_nimh <- function(base, extension) {
  name <- paste(base, extension, sep = ".")
  name_gz <- paste(name, "gz", sep = ".")
  gz <- xfun::normalize_path(file.path(outdir_nifti, name_gz))
  download.file(paste(url_nimh, name_gz, sep = "/"), gz)
  R.utils::gunzip(gz)
}

# avg152T1_LR
# avg152T1_RL
# - Two images in nifti1 format (dual file or single file) in MNI152 space, with appropriate sform and qform (gzipped for convenient transfer)
# - dimensions: 91 x 109 x 91 ; 2mm x 2mm x 2mm
# - The first image (LR) is stored in radiological convention. The second image (RL) is stored in neurological convention.
# Aspects tested:
# - Single and dual file nifti format
# - Both have 91 slices
# - 3-dimensional
# - Image dimensions
# - Have same header fields
# - Header value qoffset_x, descrip, data_type, scl_slope, glmin, glmax, srow_z
# - Number of slices
# - Standard header fields
# - header_value and nifti1_header_values as different ways to get values, both return 46 values, test values
# - Single file and dual file formats return same header information
# - LR and RL files have same header information
# - Header value for srow_z is a numeric vector
# - When converting to 3D matrix, can't use option to hold extra dimensions constant because there are none
# - When converting to matrix or 3D matrix, matrix has correct dimensions
# - Can view specific slice from image object or matrix
# - Must provide a slice number to view_slice for 3D image
avg152T1_LR_hdr <- download_nimh("avg152T1_LR_nifti", "hdr")
avg152T1_LR_img <- download_nimh("avg152T1_LR_nifti", "img")
avg152T1_LR_nii <- download_nimh("avg152T1_LR_nifti", "nii")
avg152T1_LR_base <- gsub(".hdr", "", avg152T1_LR_hdr)
nifti_data_avg152T1_LR_hi <- read_nifti1(avg152T1_LR_base)
nifti_data_avg152T1_LR <- read_nifti1(avg152T1_LR_nii)
avg152T1_RL_hdr <- download_nimh("avg152T1_RL_nifti", "hdr")
avg152T1_RL_img <- download_nimh("avg152T1_RL_nifti", "img")
avg152T1_RL_nii <- download_nimh("avg152T1_RL_nifti", "nii")
avg152T1_RL_base <- gsub(".hdr", "", avg152T1_RL_hdr)
nifti_data_avg152T1_RL_hi <- read_nifti1(avg152T1_RL_base)
nifti_data_avg152T1_RL <- read_nifti1(avg152T1_RL_nii)

# filtered_func_data
# - A simple image time-series in gzipped single file nifti-1 form
# - dimensions: 64 x 64 x 21 x 180 ; 4mm x 4mm x 6mm x 3 sec
# Aspects tested:
# - Number of slices
# - Number of dimensions is 4
# - Image dimensions are correct and include 4th dimension
# - Set of header fields
# - Size of header is 348
# - Header value extender is c(0,0,0,0)
# - Header value bitpix
# - img_data_to_3D_mat
#    - When fixing extra dimensions, must have valid index
#    - When collapsing 4th dimension, 3D matrix has correct dimensions
#    - For 4D matrix, must provide way to collapse 4th dimension
#    - Dimensions to collapse can be scalar or vector
#    - Can only provide existing number of dimensions to collapse
# - img_data_to_mat returns 4D matrix with correct dimensions
# - View slice by converting to 3D matrix
# - Can't just view a slice due to extra dimensions
# - Can't just use view_slice_mat to view a slice of 4D matrix
filtered_func <- download_nimh("filtered_func_data", "nii")
nifti_data_filtered_func <- read_nifti1(filtered_func)

# minimal data
# - The "minimal" dataset minimal.hdr, minimal.img and minimal.nii is provided as an example
#   and test dataset. It contains close to the minimum number of header fields that need to be
#   set in nifti1 dataset and have it still conform to the nifti1 standard. It is not the very
#   minimum, because one could create 1 dimensional image. But, we wanted to provide a minimal
#   dataset that could be loaded and viewed as an image. minimal.img is a simple ramp image,
#   increasing from 0-63 along the Y axis. See the nifti FAQ question #4 for an explanation of
#   the minimal fields that must be set in nifti1 datasheet.
# Aspects tested:
# - Has 3 dimensions
# - Blank and 0 header values obtained by various methods
minimal_base <- xfun::normalize_path(file.path(outdir_nifti, "minimal"))
minimal <- download_nimh("minimal", "hdr")
minimal <- download_nimh("minimal", "img")
nifti_data_minimal_hi <- read_nifti1(minimal_base)

# SIRP
# - Sternberg Item Recognition Paradigm (SIRP) fMRI Study + XML Extension Data
# - 147 volumes of a SIRP study in a single NIfTI *.nii image file with sform and qforms properly
#   set and an extension space consisting of the XCEDE XML formatted E-prime task data, Quickmood
#   assessments acquired before and after the scanning session, and the image acquisition parameters.
#   The first volume of the series contains an "L" superimposed on the left side of the volume to
#   help in testing implementations that read the qforms.
# Aspects tested:
# - Num slices
# - Num dimensions is 4
# - The 4 dimensions are correct
# - Header value glmin
# - Conversion to 3D matrix holding one dimension constant returns correct 3D matrix
# - Conversion to matrix returns correct 4D matrix
sirp_gz <- xfun::normalize_path(file.path(outdir_nifti, "sirp_fmri_study_ver4.tar.gz"))
sirp_file <- xfun::normalize_path(file.path(outdir_nifti, "newsirp_final_XML.nii"))
download.file("https://nifti.nimh.nih.gov/nifti-1/data/sirp_fmri_study_ver4.tar.gz", sirp_gz)
untar(sirp_gz, exdir = outdir_nifti)
nifti_data_sirp <- read_nifti1(sirp_file, reorient = F)

# zstat1
# - A single z-statistic image in gzipped single file nifti-1 form
# - dimensions: 64 x 64 x 21 ; 4mm x 4mm x 6mm
# Aspects tested:
# - Num slices
# - Set of header fields
# - Correct image dimensions
# - Header value magic
# - Correct conversion to 3D matrix
zstat1_nii <- download_nimh("zstat1", "nii")
nifti_data_zstat1 <- read_nifti1(zstat1_nii)



# http://www.neuromorphometrics.com/?page_id=310
# Labeled MRI brain scan
file_1103 <- xfun::normalize_path(file.path(outdir_nifti, "Data/1103/3/NIFTI/1103_3.nii"))
file_1103_glm <- xfun::normalize_path(file.path(outdir_nifti, "Data/1103/3/NIFTI/1103_3_glm.nii"))
gz_1103 <- xfun::normalize_path(file.path(outdir_nifti, "1103_3.tgz"))
download.file("http://www.neuromorphometrics.com/1103_3.tgz", gz_1103)
untar(gz_1103, exdir = outdir_nifti)

# nifti_data_1103_3 and nifti_data_1103_3_glm
# Aspects tested:
# - Num slices
# - Image dimensions
# - nifti1_num_dim
# - Set of header fields
# - Header value slice_code, regular, qoffset_x, descrip, quatern_b, bitpix
# - nifti1_header_values returns list with correct names and values
# - Number of dimensions
# - Correct conversion to matrix and 3D matrix
nifti_data_1103_3 <- read_nifti1(file_1103)
nifti_data_1103_3_glm <- read_nifti1(file_1103_glm)


# John Muschelli's Neurohacking Coursera course data
download_jm <- function(path, outfile) {
  saved_file <- xfun::normalize_path(file.path(outdir_nifti, outfile))
  download.file(paste("https://github.com/muschellij2/Neurohacking_data/raw/master/", path, sep = ""),
                saved_file)
  saved_file
}

# https://github.com/muschellij2/Neurohacking_data/tree/master/BRAINIX/NIfTI
# Aspects tested:
# - Dimensions
# - Num slices
# - Num dimensions
# - Set of header fields
# - Header values with header_value and nifti1_header_values
# - Conversion to matrix and 3D matrix
# - Header value srow_z is numeric vector
nifti_data_flair <- read_nifti1(download_jm("BRAINIX/NIfTI/FLAIR.nii.gz", "FLAIR.nii.gz"), reorient = F)
nifti_data_flair_regToT1 <- read_nifti1(download_jm("BRAINIX/NIfTI/FLAIR_regToT1.nii.gz", "FLAIR_regToT1.nii.gz"), reorient = F)
nifti_data_roi <- read_nifti1(download_jm("BRAINIX/NIfTI/ROI.nii.gz", "ROI.nii.gz"), reorient = F)
nifti_data_roi_regToT1_SyNtoMNI <- read_nifti1(download_jm("BRAINIX/NIfTI/ROI_regToT1_SyNtoMNI.nii.gz", "ROI_regToT1_SyNtoMNI.nii.gz"))
nifti_data_t1 <- read_nifti1(download_jm("BRAINIX/NIfTI/T1.nii.gz", "T1.nii.gz"), reorient = F)
nifti_data_t1_SyNtoMNI <- read_nifti1(download_jm("BRAINIX/NIfTI/T1_SyNtoMNI.nii.gz", "T1_SyNtoMNI.nii.gz"))

# https://github.com/muschellij2/Neurohacking_data/tree/master/Template
# Aspects tested:
# - Dimensions
# - Header values
# - Conversion to matrix and 3D matrix
# - Num slices
# - Num dimensions
nifti_data_JHU_MNI_SS_T1_brain <- read_nifti1(download_jm("Template/JHU_MNI_SS_T1_brain.nii.gz", "JHU_MNI_SS_T1_brain.nii.gz"))
nifti_data_JHU_MNI_SS_T1_mask <- read_nifti1(download_jm("Template/JHU_MNI_SS_T1_mask.nii.gz", "JHU_MNI_SS_T1_mask.nii.gz"))
nifti_data_MNI152_T1_1mm_brain <- read_nifti1(download_jm("Template/MNI152_T1_1mm_brain.nii.gz", "MNI152_T1_1mm_brain.nii.gz"))

# https://github.com/muschellij2/Neurohacking_data/tree/master/kirby21/visit_1/113
# Aspects tested:
# - Num slices
# - Dimensions
# - Num dimensions
# - Header values
# - Header fields
# - Conversion to matrix and 3D matrix
nifti_data_113_01_MPRAGE <- read_nifti1(download_jm("kirby21/visit_1/113/113-01-MPRAGE.nii.gz", "113-01-MPRAGE.nii.gz"))
nifti_data_113_01_MPRAGE_mask <- read_nifti1(download_jm("kirby21/visit_1/113/113-01-MPRAGE_mask.nii.gz", "113-01-MPRAGE_mask.nii.gz"))
nifti_data_FLIRT_113_01_T2w_regToT1 <- read_nifti1(download_jm("kirby21/visit_1/113/FLIRT_113-01-T2w_regToT1.nii.gz", "FLIRT_113-01-T2w_regToT1.nii.gz"))


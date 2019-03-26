## ----echo = F, message = F-----------------------------------------------
api_key <- Sys.getenv("TCIA_API_KEY")
if(identical(api_key, "")) {
  knitr::opts_chunk$set(eval = FALSE)
  message("Note: code examples will not be evaluated because the system does not have a valid API key installed.")
}

## ------------------------------------------------------------------------
library(TCIApathfinder)

# Pick a patient of interest
patient <- "TCGA-AR-A1AQ"

# Get information on all image series for this patient
series <- get_series_info(patient_id = patient)

# Pick an image series to download
series_instance_uid <- as.character(series$series[1, "series_instance_uid"])

# Download and unzip the image series
ser <- save_image_series(series_instance_uid = series_instance_uid, out_dir = "~/Desktop", out_file_name = "series1.zip")
dicom_dir <- "~/Desktop/series1/"
unzip("~/Desktop/series1.zip", exdir = dicom_dir)

## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(oro.dicom))

# Read in the DICOM images and create a 3D array of intensities
dicom_list <- readDICOM(dicom_dir)
img_array_3d <- create3D(dicom_list)

# Check the dimensions of the 3D array
dim(img_array_3d)


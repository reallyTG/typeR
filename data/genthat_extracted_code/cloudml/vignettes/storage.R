## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval=FALSE)

## ------------------------------------------------------------------------
#  library(cloudml)
#  
#  # copy from a local directory to a bucket
#  gs_copy("training-data", "gs://quarter-deck-529/training-data")
#  
#  # copy from a bucket to a local directory
#  gs_copy("gs://quarter-deck-529/training-data", "training-data")

## ------------------------------------------------------------------------
#  # synchronize a bucket and a local directory
#  gs_rsync("gs://quarter-deck-529/training-data", "training-data")

## ------------------------------------------------------------------------
#  library(tfdatasets)
#  library(cloudml)
#  
#  data_dir <- gs_data_dir("gs://mtcars-data")
#  mtcars_csv <- file.path(data_dir, "mtcars.csv")
#  
#  mtcars_dataset <- csv_dataset(mtcars_csv) %>%
#    dataset_prepare(x = c(mpg, disp), y = cyl)

## ------------------------------------------------------------------------
#  library(cloudml)
#  library(readr)
#  data_dir <- gs_data_dir_local("gs://quarter-deck-529/training-data")
#  train_data <- read_csv(file.path(data_dir, "train.csv"))
#  test_data <- read_csv(file.path(data_dir, "test.csv"))

## ------------------------------------------------------------------------
#  train_generator <- flow_images_from_directory(
#    gs_data_dir_local("gs://quarter-deck-529/images/train"),
#    image_data_generator(rescale = 1/255),
#    target_size = c(150, 150),
#    batch_size = 32,
#    class_mode = "binary"
#  )

## ------------------------------------------------------------------------
#  library(keras)
#  library(cloudml)
#  
#  # define a flag for the location of the data directory
#  FLAGS <- flags(
#    flag_string("data_dir", "data")
#  )
#  
#  # determine the location of the directory (during local development this will
#  # be the default "data" subdirectory specified in the FLAGS declaration above)
#  data_dir <- gs_data_dir_local(FLAGS$data_dir)
#  
#  # read the data
#  train_data <- read_csv(file.path(FLAGS$data_dir, "train.csv"))
#  

## ------------------------------------------------------------------------
#  gcloud_terminal()


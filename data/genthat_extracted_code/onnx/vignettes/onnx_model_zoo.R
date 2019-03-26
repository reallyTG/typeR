## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(eval = FALSE)

## ----eval=FALSE----------------------------------------------------------
#  library(onnx)
#  library(reticulate)
#  np <- import("numpy", convert = FALSE)
#  backend <- import("onnx_tf.backend")

## ----eval=FALSE----------------------------------------------------------
#  load_npz_samples <- function(npz_path) {
#    sample <- np$load(normalizePath(npz_path), encoding = 'bytes')
#    list(
#      inputs = sample$items()[[0]][[1]][[0]],
#      outputs = sample$items()[[1]][[1]]
#    )
#  }

## ----eval=FALSE----------------------------------------------------------
#  # Specify paths to ONNX model and testing samples
#  onnx_model_dir <- "~/Downloads/resnet50"
#  model_pb_path <- file.path(onnx_model_dir, "model.onnx")
#  npz_path <- file.path(onnx_model_dir, "test_data_0.npz")
#  
#  # Load ONNX model
#  model <- load_from_file(model_pb_path)
#  
#  # Load testing sample from numpy serialized archive
#  samples <- load_npz_samples(npz_path)
#  inputs <- samples$inputs
#  expected_outputs <- samples$outputs
#  
#  # Run the model with an onnx backend
#  actual_outputs <- backend$run_model(model, inputs)

## ----eval=FALSE----------------------------------------------------------
#  np$testing$assert_almost_equal(expected_outputs, actual_outputs, decimal = 6)


## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE--------------------------------------------------------
#  obj_filename <- file.choose() # Choose file with binary star
#  obj_stat <- speckle_stat(obj_filename)

## ----eval = FALSE--------------------------------------------------------
#  dark_filename <- file.choose() # Choose file with dark frames
#  dark_stat <- speckle_stat(dark_filename)

## ----eval = FALSE--------------------------------------------------------
#  flat_filename <- file.choose() # Choose file with flat field frames
#  flat_stat <- speckle_stat(flat_filename)

## ----eval = FALSE--------------------------------------------------------
#  zero_matrix <- matrix(0, 512, 512)
#  mid_dark <- middle_frame(filename = dark_filename, subtrahend = zero_matrix)

## ----eval = FALSE--------------------------------------------------------
#  mid_flat <- middle_frame(flat_filename, subtrahend = mid_dark)

## ----eval = FALSE--------------------------------------------------------
#  ps_diff <- speckle_ps_diff(obj_filename)

## ----eval = FALSE--------------------------------------------------------
#  acf <- speckle_acf(ps_diff)

## ----eval = FALSE--------------------------------------------------------
#  ps <- speckle_ps(obj_filename, dark = mid_dark, flat = mid_flat)

## ---- echo = FALSE, out.width = "400px", fig.cap = "Fig. 1. Power spectrum of star ADS 15182 in 550/20 nm band."----
knitr::include_graphics("Power_spectrum.png")


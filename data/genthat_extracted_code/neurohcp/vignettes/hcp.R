## ----setup, include=FALSE------------------------------------------------
library(neurohcp)
library(dplyr)
knitr::opts_chunk$set(echo = TRUE, cache = FALSE, comment = "")

## ---- eval = FALSE-------------------------------------------------------
#  source("http://neuroconductor.org/neurocLite.R")
#  neuro_install("neurohcp", release = "stable")

## ---- eval = FALSE-------------------------------------------------------
#  set_aws_api_key(access_key = "ACCESS_KEY", secret_key = "SECRET_KEY")

## ----blist_show, eval = FALSE--------------------------------------------
#  if (have_aws_key()) {
#    neurohcp::bucketlist()
#  }

## ----blist_go, echo = FALSE----------------------------------------------
if (have_aws_key()) {
  neurohcp::bucketlist(verbose = FALSE)
}

## ---- eval = TRUE--------------------------------------------------------
ids_with_dwi = hcp_900_scanning_info %>% 
  filter(scan_type %in% "dMRI") %>% 
  select(id) %>% 
  unique
head(ids_with_dwi)

## ---- eval = FALSE, echo = TRUE------------------------------------------
#  r = download_hcp_dir("HCP/100307/T1w/Diffusion", verbose = FALSE)
#  print(basename(r$output_files))

## ---- eval = TRUE, echo = FALSE------------------------------------------
r = list(output_files = c("bvals", "bvecs", "data.nii.gz", "grad_dev.nii.gz", "nodif_brain_mask.nii.gz")
)
r$output_files

## ---- eval = FALSE-------------------------------------------------------
#  ids_with_dwi = ids_with_dwi %>%
#    mutate(id_dir = paste0("HCP/", id, "/T1w/Diffusion"))

## ----dl_file-------------------------------------------------------------
if (have_aws_key()) {
  ret = download_hcp_file("HCP/100307/T1w/Diffusion/bvals", verbose = FALSE)
}


## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(nsrr)
nsrr_auth()

## ----example-------------------------------------------------------------
library(nsrr)
df = nsrr_datasets()
DT::datatable(df)

## ----ls------------------------------------------------------------------
df = nsrr_dataset_files("shhs", path = "datasets")
head(df)

## ----dl------------------------------------------------------------------
url = nsrr_download_url("shhs", path = "datasets/CHANGELOG.md", token = "")
url # print URL
dl = nsrr_download_file("shhs", path = "datasets/CHANGELOG.md", token = "")
dl$outfile
cat(head(readLines(dl$outfile)), sep = "\n")

## ---- eval = FALSE-------------------------------------------------------
#  nsrr_all_dataset_files("shhs")


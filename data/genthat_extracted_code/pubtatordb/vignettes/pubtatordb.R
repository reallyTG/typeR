## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("pubtatordb")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("mamc-dci/pubtatordb")

## ----message=FALSE, warning=FALSE----------------------------------------
# Load the package.
library(pubtatordb)

## ---- eval=FALSE---------------------------------------------------------
#  # Download the data.
#  # Use the full path. Writing to the temp directory is not recommended.
#  download_dir <- tempdir()
#  download_pt(download_dir)

## ---- eval=FALSE---------------------------------------------------------
#  # Define the data directory, a subdirectory of the above directory.
#  pubtator_path <- file.path(download_dir, "PubTator")
#  
#  # Create the database.
#  pt_to_sql(
#    pubtator_path,
#    skip_behavior = FALSE,
#    remove_behavior = TRUE
#  )

## ---- eval=FALSE---------------------------------------------------------
#  # Create a connection to the database.
#  db_con <- pt_connector(pubtator_path)

## ---- eval=FALSE---------------------------------------------------------
#  # Query the data.
#  pt_select(
#    db_con,
#    "gene",
#    columns = NULL,
#    keys = NULL,
#    keytype = NULL,
#    limit = 5
#  )

## ---- eval=FALSE---------------------------------------------------------
#  # Query the data.
#  pt_select(
#    db_con,
#    "gene",
#    columns = c("PMID", "ENTREZID"),
#    keys = C("7356", "4199"),
#    keytype = "ENTREZID",
#    limit = 5
#  )

## ---- eval=FALSE---------------------------------------------------------
#  pt_tables(db_con)

## ---- eval=FALSE---------------------------------------------------------
#  pt_columns(db_con, "species")

## ------------------------------------------------------------------------
pubtator_citations()


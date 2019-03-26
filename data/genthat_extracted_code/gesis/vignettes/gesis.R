## ----load----------------------------------------------------------------
library(gesis)

## ----groups--------------------------------------------------------------
groups <- get_study_groups()
head(groups, 10)

## ----eurobar_waves-------------------------------------------------------
eurobars <- get_datasets("0008")
head(eurobars)

## ----login, eval=FALSE---------------------------------------------------
#  # username and password stored as environment
#  # variables "GESIS_USER" and "GESIS_PASS"
#  gesis_session <- login()

## ----create_dir----------------------------------------------------------
if(!dir.exists("downloads")) dir.create("downloads")

## ---- eval=FALSE---------------------------------------------------------
#  download_dataset(s = gesis_session, doi = eurobars$doi[1:3],
#                   path = "downloads", filetype = ".dta")

## ----list_files----------------------------------------------------------
files <- list.files("downloads", full.names = TRUE)

## ----codebooks-----------------------------------------------------------
download_codebook(eurobars$doi[1:3], path = "downloads")

## ----read_data, eval=FALSE-----------------------------------------------
#  # library(haven)
#  df <- read_dta(files[1])
#  dim(df)

## ----remove_downloads, echo=FALSE----------------------------------------
unlink("downloads", recursive = TRUE)


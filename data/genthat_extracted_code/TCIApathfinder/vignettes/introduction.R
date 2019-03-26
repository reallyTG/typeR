## ----echo = F, message = F-----------------------------------------------
api_key <- Sys.getenv("TCIA_API_KEY")
if(identical(api_key, "")) {
  knitr::opts_chunk$set(eval = FALSE)
  message("Note: code examples will not be evaluated because the system does not have a valid API key installed.")
}

## ----eval = F------------------------------------------------------------
#  install.packages("TCIApathfinder")

## ----eval = F------------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("pamelarussell/TCIApathfinder")

## ------------------------------------------------------------------------
library(TCIApathfinder)

## ------------------------------------------------------------------------
collections <- get_collection_names()
head(collections$collection_names)

## ------------------------------------------------------------------------
modalities <- get_modality_names()
head(modalities$modalities)

## ------------------------------------------------------------------------
body_parts <- get_body_part_names()
head(body_parts$body_parts)

## ------------------------------------------------------------------------
patients_tcga_brca <- get_patient_info(collection = "TCGA-BRCA")
head(patients_tcga_brca$patients)

## ------------------------------------------------------------------------
series <- get_series_info(patient_id = "TCGA-AR-A1AQ")
head(series$series)

## ------------------------------------------------------------------------
studies <- get_patient_studies(patient_id = "TCGA-AR-A1AQ")
head(studies$patient_studies)

## ------------------------------------------------------------------------
studies_tcga_brca <- get_studies_in_collection(collection = "TCGA-BRCA")
head(studies_tcga_brca$studies)

## ------------------------------------------------------------------------
sop_uids <- get_sop_instance_uids(
  series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.3344.4002.298037359751562809791703106256")
head(sop_uids$sop_instance_uids)

## ------------------------------------------------------------------------
im <- save_single_image(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.3344.4002.298037359751562809791703106256",
                  sop_instance_uid = "1.3.6.1.4.1.14519.5.2.1.3344.4002.113224119964450170072494597907",
                  out_dir = "~/Desktop")
im$out_file

## ------------------------------------------------------------------------
ser <- save_image_series(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.3344.4002.298037359751562809791703106256",
                         out_dir = "~/Desktop", out_file_name = "series.zip")
ser$out_file


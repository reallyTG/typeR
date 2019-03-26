## ----setup, include=FALSE------------------------------------------------
suppressWarnings({
  suppressPackageStartupMessages({
    loadNamespace("knitr") # for opts_chunk only
    library("icd")
    library("magrittr")
    })
  })
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----uranium-long--------------------------------------------------------
uranium_pathology[1:10, ]

## ----explain10-----------------------------------------------------------
explain_code("R55")

## ----uranium-wide--------------------------------------------------------
uranium_pathology %>% long_to_wide %>% head

## ----comorbidities-------------------------------------------------------
quan_comorbidities <- comorbid(uranium_pathology, icd10_map_quan_elix)
# see the first few rows and columns:
quan_comorbidities[1:6, 3:10]

## ----cholera-------------------------------------------------------------
# create trivial comorbidity map:
cholera_typhoid_map <- list(cholera = "A00", typhoid = "A01")
patients <- data.frame(patient = c("0001", "0001", "0002"), 
                       code = c("A001234567", "A01", "A019"))
comorbid(patients , map = cholera_typhoid_map)

## ----htncx---------------------------------------------------------------
icd10_map_quan_elix$HTNcx

## ----icd10pcs------------------------------------------------------------
set.seed(1441)
pts <- data.frame(id = sample(LETTERS, 10),
                  pc = sample(icd10_pcs[["2018"]]$code, 10))
res <- icd10_comorbid(pts,
                      map = icd10_map_ahrq_pcs, 
                      icd_name = "pc",
                      return_binary = TRUE)
print(res)
colSums(res)


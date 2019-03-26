## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- eval = FALSE-------------------------------------------------------
#  system.file("pccc_references/Categories_of_CCCv2_and_Corresponding_ICD.docx", package = "pccc")

## ---- message = FALSE----------------------------------------------------
library(pccc)
library(dplyr)

## ------------------------------------------------------------------------
dat <- data.frame(ids = c("A", "B", "C"), 
                  dxs = c("4251", "425.1", "425.1"), 
                  procs = c("37.51", "3751", "37.51"))
dat
ccc(dat, 
    id = ids, 
    dx_cols = dxs, 
    pc_cols = procs, 
    icdv = 9)

## ----eval = FALSE--------------------------------------------------------
#  pccc_icd9_dataset <- generate_sample(
#    v = 9,
#    n_rows = 10000,
#    d_cols = 10,
#    p_cols = 10,
#    g_cols = 10
#  )
#  
#  save(pccc_icd9_dataset, file="pccc_icd9_dataset.rda")

## ------------------------------------------------------------------------
library(dplyr)
library(pccc)

ccc_result <-
    ccc(pccc::pccc_icd9_dataset[, c(1:21)], # get id, dx, and pc columns
        id      = id,
        dx_cols = dplyr::starts_with("dx"),
        pc_cols = dplyr::starts_with("pc"),
        icdv    = 09)

# review results
head(ccc_result)

# view number of patients with each CCC
sum_results <- dplyr::summarize_at(ccc_result, vars(-id), sum) %>% print.data.frame

# view percent of total population with each CCC
dplyr::summarize_at(ccc_result, vars(-id), mean) %>% print.data.frame




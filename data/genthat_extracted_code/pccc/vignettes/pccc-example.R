## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- message = FALSE----------------------------------------------------
library(pccc)
library(dplyr)

## ---- eval = FALSE-------------------------------------------------------
#  # download and unzip file from ftp://ftp.cdc.gov/pub/health_statistics/nchs/datasets/comparability/icd9_icd10/ICD9_ICD10_comparability_public_use_ASCII.ZIP
#  # columns of interest
#  # start end     width description
#  # 64  -  64     1     Age Code
#  # 65  -  66     2     Age Value
#  #                     Code Value     Description
#  #                     0    01-99     Years less than 100
#  #                     1    00-99     Years 100 or more
#  #                     2    01-11,99  Months
#  #                     3    01-03,99  Weeks
#  #                     4    01-27,99  Days
#  #                     5    01-23, 99 Hours
#  #                     6    01-59, 99 Minutes
#  #                     9    99        Age not stated
#  # 142 - 145     4     ICD Code 9th Revision (Underlying Cause of Death)
#  # 444 - 447     4     ICD-10 Underlying Cause Code
#  
#  library(readr)
#  
#  mcod <- readr::read_fwf("ICD9_ICD10_comparability_public_use_ASCII.dat",
#                          readr::fwf_positions(
#                            start = c(64, 65, 142, 444),
#                            end = c(64, 66, 145, 447),
#                            col_names = c('age_code', 'age', 'icd9', 'icd10')),
#                          col_types = 'iicc')
#  mcod <- mcod[
#               (mcod$age_code == 0 & mcod$age <= 21) |
#               (mcod$age_code %in% c(2, 3, 4, 5, 6))
#              , ]
#  mcod <- dplyr::mutate(mcod, id = seq_along(age))
#  mcod <- mcod[c("id", "icd9", "icd10")]

## ------------------------------------------------------------------------
# Show data
head(pccc::comparability, 10)


## ------------------------------------------------------------------------
# Run PCCC on ICD-9-CM codes

ccc_result_icd9 <-
    ccc(pccc::comparability, # get id, dx, and pc columns
        id      = id,
        dx_cols = icd9,
        pc_cols = ,
        icdv    = 09)

# review results
head(ccc_result_icd9)

# view number of patients with each CCC
sum_results <- dplyr::summarize_at(ccc_result_icd9, vars(-id), sum) %>% print.data.frame

# view percent of total population with each CCC
dplyr::summarize_at(ccc_result_icd9, vars(-id), mean) %>% print.data.frame



## ------------------------------------------------------------------------
# Run PCCC on ICD-10-CM codes

ccc_result_icd10 <-
    ccc(pccc::comparability, # get id, dx, and pc columns
        id      = id,
        dx_cols = icd10,
        pc_cols = ,
        icdv    = 10)

# review results
head(ccc_result_icd10)

# view number of patients with each CCC
sum_results <- dplyr::summarize_at(ccc_result_icd10, vars(-id), sum) %>% print.data.frame

# view percent of total population with each CCC
dplyr::summarize_at(ccc_result_icd10, vars(-id), mean) %>% print.data.frame




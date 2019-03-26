## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(qsort)

## ---- eval = F-----------------------------------------------------------
#  install.packages("qsort")
#  library(qsort)

## ---- eval = T-----------------------------------------------------------
head(qset_ccq)

## ---- eval = F-----------------------------------------------------------
#    qsort_score(x, qset, qsort_length, item1, subj_id = NULL,  group_id = NULL)

## ---- eval = T-----------------------------------------------------------
data_ccq <- qsort_score(x = ex_qsort$ccq, qset_ccq, qsort_length = 100, item1 = "ccq1", subj_id = "participant", group_id = "classroom")
data_ccq

## ---- eval = T-----------------------------------------------------------
subset(data_ccq, select = c("participant", "classroom", "scomp_c", "sest_c", "egores_c", "egocont_c"))

## ---- eval = T-----------------------------------------------------------
data_aqs <- qsort_score(x = ex_qsort$aqs, qset_aqs, qsort_length = 90, item1 = "aqs1")
data_aqs

## ---- eval = F-----------------------------------------------------------
#  print_cards(qset, desc_col = "description", dir.print)

## ---- eval = F-----------------------------------------------------------
#  print_cards(qset_aqs, desc_col = "description", dir.print = getwd())


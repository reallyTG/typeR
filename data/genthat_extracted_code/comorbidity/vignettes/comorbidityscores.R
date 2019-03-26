## ----setup, include = FALSE-----------------------------------------------------------------------
options(width = 100)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center", fig.height = 6, fig.width = 6,
  out.width = "66.66%"
)

## ----load-package---------------------------------------------------------------------------------
library(comorbidity)

## ----simulate-data--------------------------------------------------------------------------------
data9 <- data.frame(
  id = sample(1:10, size = 250, replace = TRUE),
  code = sample_diag(n = 250, version = "ICD9_2015"),
  stringsAsFactors = FALSE
)
data9 <- data9[order(data9$id), ]
data10 <- data.frame(
  id = sample(1:10, size = 250, replace = TRUE),
  code = sample_diag(n = 250, version = "ICD10_2011"),
  stringsAsFactors = FALSE
)
data10 <- data10[order(data10$id), ]

## ----charlson-9-----------------------------------------------------------------------------------
charlson9 <- comorbidity(x = data9, id = "id", code = "code", score = "charlson", icd = "icd9")
str(charlson9)

## ----charlson-10----------------------------------------------------------------------------------
charlson10 <- comorbidity(x = data10, id = "id", code = "code", score = "charlson", icd = "icd10")
str(charlson10)

## ----elixhauser-9---------------------------------------------------------------------------------
elixhauser9 <- comorbidity(x = data9, id = "id", code = "code", score = "elixhauser", icd = "icd9")
str(elixhauser9)

## ----elixhauser-10--------------------------------------------------------------------------------
elixhauser10 <- comorbidity(x = data10, id = "id", code = "code", score = "elixhauser", icd = "icd10")
str(elixhauser10)


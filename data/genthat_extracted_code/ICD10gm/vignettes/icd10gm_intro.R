## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  vignette("icd10gm_intro", package = "ICD10gm")

## ---- message = FALSE----------------------------------------------------
library(dplyr)
library(purrr)
library(tidyr)
library(ICD10gm)

## ------------------------------------------------------------------------
get_icd_labels("A09", year = 2018) %>%
  knitr::kable(row.names = FALSE)

## ------------------------------------------------------------------------
icd_showchanges_icd3("A09") %>%
  knitr::kable(row.names = FALSE)

## ------------------------------------------------------------------------
get_icd_labels(icd3 = c("A09", "K52"), year = 2009:2010) %>%
  arrange(year, icd_sub) %>% 
  filter(icd_sub %in% c("K529") | icd3 == "A09") %>% 
  select(year, icd_normcode, label) %>% 
  knitr::kable(row.names = FALSE)

## ------------------------------------------------------------------------
is_icd_code(c("E10.1", "E101", "E10.1-", "J44", "This is not an ICD code"))

## ---- message = FALSE, eval = FALSE--------------------------------------
#  library(dplyr)
#  library(rvest)
#  
#  read_html("https://www.dimdi.de/static/de/klassifikationen/icd/icd-10-gm/kode-suche/htmlgm2018/block-a00-a09.htm") %>%
#    html_text() %>%
#    icd_parse(type = "bounded") %>%
#    select(-icd_spec) %>%
#    unique() %>%
#    filter(icd_sub >= "A10") %>%
#    arrange(icd_sub) %>%
#    left_join(
#      get_icd_labels(year = 2018)[, c("icd_sub", "icd_normcode", "label")],
#      by = "icd_sub") %>%
#    select(icd_normcode, label) %>%
#    knitr::kable(row.names = FALSE,
#                 caption = "Additional ICD-10 codes referred to in block A00-A09 (Intestional infectious diseases) of the ICD-10-GM (2018).")

## ------------------------------------------------------------------------
icd_k58 <- data.frame(DIAG_GROUP = c("IBS", "IBS"), ICD_SPEC = c("K58", "F45.32")) %>% 
  icd_expand(col_icd = "ICD_SPEC", year = 2019, col_meta = "DIAG_GROUP")
  
knitr::kable(icd_k58)

## ------------------------------------------------------------------------
icd_history(icd_k58, years = 2017:2019) %>% 
  select(icd_spec, DIAG_GROUP, year, icd_code) %>% 
  arrange(year, icd_code)

## ---- warning=FALSE------------------------------------------------------
citation(package = "ICD10gm")


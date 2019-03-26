## ----setup, echo = FALSE, cache = FALSE----------------------------------
suppressWarnings({
  suppressPackageStartupMessages({
    loadNamespace("knitr") # for opts_chunk only
    library("icd")
    library("magrittr")
    library("utils")
    })
  })

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----arrythmiaexpand, eval = FALSE---------------------------------------
#  "746.3" %i9da% "746.6"
#  # equivalent to:
#  identical("746.3" %i9da% "746.6",
#    icd:::expand_range("746.3", "746.6", defined = FALSE))

## ----arrythmiadefinedonly, eval = FALSE----------------------------------
#  "746.3" %i9d% "746.6"

## ----ranges, eval = FALSE------------------------------------------------
#  # get all possible codes
#  "003" %i9sa% "0033" %>% head(9) # show first 9 of 111 values
#  # just get the ones which correspond to diagnoses (keeping the 3-digit chapters)
#  "494" %i9s% "4941"
#  
#  "10099" %i9sa% "10101"
#  "V10" %i9da% "V10.02"
#  "E987" %i9da% "E988.1"
#  
#  # can't range between different types:
#  "V10" %i9s% "E800" # should throw an error

## ----rangeanomaly--------------------------------------------------------
icd:::expand_range("4820", "4823") # default, equivalent to %i9s%
icd:::expand_range("4820", "4823", defined = FALSE)
# see the first few differences (which are by definition not 'real' codes):
setdiff(icd:::expand_range("4820", "4823", defined = FALSE),
        icd:::expand_range("4820", "4823")) %>% head

## ----"childrenReal"------------------------------------------------------
children("391")
# mid-level code
children("0032")
# leaf node has no children, so returns itself
children("00320")

# pneumococcal pneumonia is a three-digit ICD-9 code with no descendants
children("481")

## ----all children--------------------------------------------------------
# first ten possible ICD-9 child codes from 391
children("391", defined = FALSE)[1:10]

## ----condense------------------------------------------------------------
icd::condense(children("0032"), defined = TRUE)

codes <- children("0032", defined = FALSE)
codes
icd::condense(codes, defined = FALSE)


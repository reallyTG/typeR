library(icd)


### Name: attr_decimal_diag
### Title: Set ICD short-form diagnosis code attribute
### Aliases: attr_decimal_diag
### Keywords: attribute internal

### ** Examples

j <- "100"
attr(j, "icd_short_diag") <- TRUE
j
attr(j, "icd_short_diag") <- FALSE
j
icd:::attr_decimal_diag(j)
as.decimal_diag(j)
# if pryr is installed, use address and refs to see what is going on




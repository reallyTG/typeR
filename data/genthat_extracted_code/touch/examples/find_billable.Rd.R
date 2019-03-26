library(touch)


### Name: find_billable
### Title: Find Billable ICD Codes from CMS GEMs
### Aliases: find_billable

### ** Examples

library(touch)

### for ICD-9 codes
icd9_major <- c("001", "316", "808", NA, "not_a_dx")

## find all billable codes under the major category
find_billable(icd9_major, version = 9)

## find the billable codes right under the major category
(icd9_billable <- find_billable(icd9_major, version = 9,
                                match_all = FALSE))

## compare the translation results
icd_map(icd9_major, nomatch = NA)
icd_map(icd9_billable, nomatch = NA)

### for ICD-10 codes
icd10_major <- c("T36.0X2", "T36.3X2", "T38.6X2")

## find all billable codes and output in different formats
find_billable(icd10_major, version = 10)
find_billable(icd10_major, version = 10, output = "list")
find_billable(icd10_major, version = 10, output = "tidy-data")

## add decimal if wanted
(icd10_billable <- find_billable(icd10_major, version = 10, decimal = TRUE))

## compare the translation results
icd_map(icd10_major, from = 10, to = 9, nomatch = NA)
icd_map(icd10_billable, from = 10, to = 9)




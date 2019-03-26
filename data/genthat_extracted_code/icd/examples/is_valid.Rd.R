library(icd)


### Name: is_valid
### Title: Check whether ICD-9 codes are syntactically valid
### Aliases: is_valid is_valid.icd10 is_valid.icd9 is_valid.comorbidity_map
###   icd_is_valid.default icd_is_valid.icd10 icd_is_valid.icd9
###   icd_is_valid.icd_comorbidity_map icd_is_valid_major
###   icd_is_valid_major.default icd_is_valid_major.icd10
###   icd_is_valid_major.icd9 icd_is_valid
### Keywords: internal

### ** Examples

  is_valid(as.icd9(c("", "1", "22", "333", "4444", "123.45", "V",
                     "V2", "V34", "V567", "E", "E1", "E70", "E")))
  # internal function:
  icd:::is_valid_major(c("", "1", "22", "333", "4444", "123.45", "V",
                     "V2", "V34", "V567", "E", "E1", "E70", "E"))




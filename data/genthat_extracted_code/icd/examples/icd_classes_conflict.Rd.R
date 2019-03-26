library(icd)


### Name: icd_classes_conflict
### Title: Check whether there are any ICD class conflicts
### Aliases: icd_classes_conflict
### Keywords: internal

### ** Examples

bad_codes <- c("100", "A01", "V100", "E999.0")
class(bad_codes) <- c("icd9", "icd10cm")
stopifnot(icd:::icd_classes_conflict(bad_codes))




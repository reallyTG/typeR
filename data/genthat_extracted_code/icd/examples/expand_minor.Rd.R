library(icd)


### Name: expand_minor
### Title: expand decimal part of ICD-9 code to cover all possible
###   sub-codes
### Aliases: expand_minor expand_minor.icd9 expand_minor.icd10
### Keywords: internal manip

### ** Examples

## Not run: 
##D   # return all possible decimal parts of ICD9 codes (111 in total)
##D   length(icd:::expand_minor(as.icd9(""), is_e = FALSE))
##D   icd:::expand_minor(as.icd9("1")) # "1"  "10" "11" "12" "13" "14" "15" "16" "17" "18" "19"
## End(Not run)




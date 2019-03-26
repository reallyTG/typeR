library(icd)


### Name: explain_code
### Title: Explain ICD-9 and ICD-10 codes in English
### Aliases: explain_code explain_icd explain_code.default
###   explain_code.list explain_code.icd9 explain_code.icd9cm
###   explain_code.icd10cm explain_code.icd10 icd_explain
###   icd_explain.default icd_explain.icd10 icd_explain.icd10cm
###   icd_explain.icd9 icd_explain.icd9cm icd_explain.list
### Keywords: internal

### ** Examples

# by default, just show parent code and ignore children (428.0 not shown
# because 428 is present):
explain_code(icd9_map_ahrq$CHF[1:3])
# same without condensing the list. In this case, 428.0 is shown:
explain_code(icd9_map_ahrq$CHF[1:3], brief = TRUE)
# The first three in the ICD-10 equivalent are a little different:
explain_code(icd10_map_ahrq$CHF[1:3], brief = TRUE)
# nice to have magrittr, but not essential
library(magrittr, warn.conflicts = FALSE, quietly = TRUE)
explain_code(icd9_map_ahrq$CHF[1:3] %>% condense)




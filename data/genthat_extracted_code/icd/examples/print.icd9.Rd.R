library(icd)


### Name: print.icd9
### Title: Print ICD codes and comorbidity maps cleanly
### Aliases: print.icd9 print.icd10
### Keywords: internal

### ** Examples

x <- structure(
  c("40201", "2258", "7208", "25001", "34400", "4011", "4011", NA),
  class = c("icd9cm", "icd9", "character"),
  icd_short_diag = TRUE)
print(x)
print(x, verbose = TRUE)
# as.factor drops any 'icd' classes
print(as.factor(x), verbose = TRUE)
u <- uranium_pathology[1:10, "icd10"]
print(u)
print(u, verbose = TRUE)
# as.character will unclass the 'icd' classes
print(as.character(u), verbose = TRUE)




library(icd)


### Name: wide_to_long
### Title: Convert ICD data from wide to long format
### Aliases: wide_to_long icd_wide_to_long

### ** Examples

widedf <- data.frame(visit_name = c("a", "b", "c"),
  icd9_01 = c("441", "4424", "441"),
  icd9_02 = c(NA, "443", NA)
  )
wide_to_long(widedf)




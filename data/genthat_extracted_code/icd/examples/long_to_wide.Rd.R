library(icd)


### Name: long_to_wide
### Title: Convert ICD data from long to wide format
### Aliases: long_to_wide icd_long_to_wide

### ** Examples

  longdf <- data.frame(visit_name = c("a", "b", "b", "c"),
    icd9 = c("441", "4424", "443", "441"))
  long_to_wide(longdf)
  long_to_wide(longdf, prefix = "ICD10_")




library(ICD10gm)


### Name: icd_parse
### Title: Extract all ICD codes from a character vector
### Aliases: icd_parse

### ** Examples

icd_parse("E11.7")
icd_parse("Depression: F32")
icd_parse(c(
  "Backpain (M54.9) is one of the most common diagnoses in primary care",
  "Codes for chronic pain include R52.1 and F45.4"
  ))




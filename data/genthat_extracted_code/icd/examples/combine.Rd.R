library(icd)


### Name: combine
### Title: combine ICD codes
### Aliases: combine c.icd9 c.icd10

### ** Examples

# Care with the following:
c(as.icd9("E998"), as.icd10("A10"))
# which results in both codes sharing the 'icd9' class.
(a <- as.icd10("A100SSX"))
(b <- as.icd10("Z999A"))
c(a, b)
c(as.icd_short_diag(a), as.icd_short_diag(b))
(d <- as.icd10("A10.0SSX"))
(e <- as.icd10("Z99.9A"))
c(d, e)
c(as.icd_decimal_diag(d), as.icd_decimal_diag(e))
# warn when mixing attribute types
suppressWarnings(
  c(as.icd_short_diag(a), as.icd_decimal_diag(e))
)




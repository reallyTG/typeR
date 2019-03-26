library(icd)


### Name: as.decimal_diag
### Title: Get or set whether ICD codes have have an attribute indicating
###   'short' or 'decimal' format
### Aliases: as.decimal_diag as.icd_decimal_diag as.short_diag
###   as.icd_short_diag is.decimal_diag is.icd_decimal_diag is.short_diag
###   is.icd_short_diag

### ** Examples

as.icd_short_diag("6670")

as.icd_short_diag("667.0") # no warning or error!

is.icd_short_diag(decimal_to_short("667.0"))

decimal_type_code <- as.icd_short_diag("667.0", FALSE)
stopifnot(is.icd_decimal_diag(decimal_type_code))

codes <- as.icd9(c("100.1", "441.3"))
codes <- as.decimal_diag(codes)
codes




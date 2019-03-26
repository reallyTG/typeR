library(icd)


### Name: set_icd_class
### Title: Construct ICD-9 and ICD-10 data types
### Aliases: set_icd_class icd9 as.icd9 icd9cm as.icd9cm as.icd10 icd10
###   as.icd10cm icd10cm comorbidity_map as.comorbidity_map
###   as.icd_comorbidity_map
### Keywords: internal

### ** Examples

x = as.icd10("A1009")
attr(x, "icd_short_diag") <- TRUE
x
attributes(x) <- list(icd_short_diag = NULL)
x

y <- as.decimal_diag(as.icd10("A10.09"))
y
is.short_diag(y)

j <- as.short_diag(as.icd10(c("A11", "B2222")))
j[2] <- "C33"
stopifnot(is.short_diag(j))
stopifnot(is.icd10(j), is.icd10(j[1]), is.icd10(j[[1]]))
j[[1]] <- "D44001"
stopifnot(is.short_diag(j))
stopifnot(is.icd10(j), is.icd10(j[2]), is.icd10(j[[2]]))




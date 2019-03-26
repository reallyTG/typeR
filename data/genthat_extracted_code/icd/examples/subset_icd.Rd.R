library(icd)


### Name: subset_icd
### Title: extract subset from ICD data
### Aliases: subset_icd [.icd9 [[.icd9 [.icd10 [[.icd10

### ** Examples

x <- list(my_codes = as.icd9(c("V10.1", "441.1")))
x[1]
x[[1]]
x[[1]][2]
# subsetting a list should give the underlying data structure type,
# preserving the ICD class
stopifnot(!inherits(x[[1]], "list"))
stopifnot(!inherits(x[[1]][2], "list"))

y <- as.icd10(c("A01", "B0234"))
y[2]
y[[2]]
stopifnot(inherits(y[2], "icd10"))
stopifnot(inherits(y[[2]], "icd10"))




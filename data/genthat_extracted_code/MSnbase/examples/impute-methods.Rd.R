library(MSnbase)


### Name: impute-methods
### Title: Quantitative proteomics data imputation
### Aliases: impute impute-methods impute,MSnSet-method imputeMethods naset
### Keywords: methods

### ** Examples

data(naset)
## table of missing values along the rows
table(fData(naset)$nNA)
## table of missing values along the columns
pData(naset)$nNA

## non-random missing values
notna <- which(!fData(naset)$randna)
length(notna)
notna

impute(naset, method = "min")

if (require("imputeLCMD")) {
    impute(naset, method = "QRILC")
    impute(naset, method = "MinDet")
}

if (require("norm"))
    impute(naset, method = "MLE")

impute(naset, "mixed",
       randna = fData(naset)$randna,
       mar = "knn", mnar = "QRILC")

## neighbour averaging

x <- naset[1:4, 1:6]
exprs(x)[1, 1] <- NA ## min value
exprs(x)[2, 3] <- NA ## average
exprs(x)[3, 1:2] <- NA ## min value and average
## 4th row: no imputation
exprs(x)

exprs(impute(x, "nbavg"))




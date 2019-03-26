library(displayHTS)


### Name: HTSdataSort
### Title: An HTS dataset sorted from HTSdata
### Aliases: HTSdataSort
### Keywords: datasets

### ** Examples

data(HTSdataSort)
boxplot(HTSdataSort[,"log2Intensity"] ~ HTSdataSort[, "WELL_USAGE"],
        cex.axis=0.75)




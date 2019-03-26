library(GENEAclassify)


### Name: summariseCols
### Title: Perform summary of vectors in the parent frame
### Aliases: summariseCols
### Keywords: internal

### ** Examples

A <- split(1:10, rep(1, each = 10))
dataCols <- matrix(c("A", "mean",
        "A", "median",
        "A", "var"), ncol = 2, byrow = TRUE)
GENEAclassify:::summariseCols(colfun = dataCols)
A <- split(1:10, rep(1:2, each = 5))
GENEAclassify:::summariseCols(colfun = dataCols)




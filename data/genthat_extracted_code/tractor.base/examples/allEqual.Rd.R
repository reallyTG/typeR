library(tractor.base)


### Name: allEqual
### Title: Test whether all elements of a vector are equal
### Aliases: allEqual

### ** Examples


allEqual(c(1,1,1))  # TRUE
allEqual(c(1,1,NA))  # FALSE
allEqual(c(1,1,NA), ignoreMissing=TRUE)  # TRUE





library(hyfo)


### Name: list2Dataframe
### Title: Convert a list to a dataframe.
### Aliases: list2Dataframe

### ** Examples

# open file attached in the package.
file <- system.file("extdata", "testdl.txt", package = "hyfo")
datalist <- dget(file) # read list file.
datalist_new <- extractPeriod(datalist, commonPeriod = TRUE)

dataframe <- list2Dataframe(datalist_new)

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/





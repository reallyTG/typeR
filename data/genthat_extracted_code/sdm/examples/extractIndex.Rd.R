library(sdm)


### Name: Extract by index
### Title: Indexing to extract records of a sdmdata object
### Aliases: [,sdmdata,missing,missing-method [,sdmdata,ANY,ANY-method
### Keywords: methods spatial

### ** Examples


file <- system.file("external/data.sdd", package="sdm")

d <- read.sdm(file)

# see the number of records:
d 
 
d2 <- d[1:10]

d2
 
d3 <- d[1:10,drop=TRUE]
 
d3





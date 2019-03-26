library(SimilaR)


### Name: SimilaR_fromDirectory
### Title: SimilaR_fromDirectory
### Aliases: SimilaR_fromDirectory

### ** Examples

## Typical example, we want to compare functions from different files, 
## but we do not want to compare two functions from the same file.
## A result is a dataframe. There will be one value describing
## similarity level.
SimilaR_fromDirectory(system.file("testdata","data",package="SimilaR"),
                                 returnType = "data.frame",
                                 fileTypes="file",
                                 aggregation = "sym")

## In this example we want to compare every pair of functions: even these,
## which are from the same file. A result is a dataframe. There will be
## two values describing similariy levels. 
SimilaR_fromDirectory(system.file("testdata","data2",package="SimilaR"),
                      returnType = "data.frame",
                      fileTypes="function",
                      aggregation = "both")

## In this example returned value is a symmetric matrix.
SimilaR_fromDirectory(system.file("testdata","data2",package="SimilaR"),
                      returnType = "matrix",
                      fileTypes="function",
                      aggregation = "tnorm")






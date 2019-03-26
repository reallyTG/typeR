library(librarian)


### Name: lib_paths
### Title: Changing and viewing the package search paths
### Aliases: lib_paths

### ** Examples

## No test: 
lib_paths()

#> [1] "D:/R/R-3.5.0/library"

lib_paths(file.path(tempdir(), "newlibraryfolder"), ask = FALSE)

#> [1] "C:/Users/.../Temp/Rtmp0Qbvgo/newlibraryfolder"
#> [2] "D:/R/R-3.5.0/library"
## End(No test)





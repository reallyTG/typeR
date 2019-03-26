library(nonmem2R)


### Name: extToTable
### Title: Compile parameter table suitable for reports
### Aliases: extToTable

### ** Examples

##### Load the .ext file "run001.ext"
# 1) Get path to the example file included in nonmem2R package
file1 <- system.file("extdata", "run001.ext", package = "nonmem2R")
# 2) Load the file using the extload function
extToTable(file1)





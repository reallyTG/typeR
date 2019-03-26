library(nonmem2R)


### Name: modload
### Title: Show model file
### Aliases: modload

### ** Examples

##### Load the .ext file "run001.mod"
# 1) Get path to the example file included in nonmem2R package
file1 <- system.file("extdata", "run001.mod", package = "nonmem2R")
# 2) Load the file using the extload function
modload(file1)





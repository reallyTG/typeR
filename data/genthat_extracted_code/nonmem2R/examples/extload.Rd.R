library(nonmem2R)


### Name: extload
### Title: Load final parameter values from a nonmem .ext output file.
### Aliases: extload

### ** Examples

##### Load the .ext file "run001.ext"
# 1) Get path to the example file included in nonmem2R package
file1 <- system.file("extdata", "run001.ext", package = "nonmem2R")
# 2) Load the file using the extload function
extload(file1)




library(nonmem2R)


### Name: sumoR
### Title: Compile summary information for NONMEM model based on the lst
###   file, ext file, and the cov file.
### Aliases: sumoR

### ** Examples

##### Compile summary information from the .lst file "run001.lst"
# 1) Get path to the example file included in nonmem2R package
file1 <- system.file("extdata", "run001.lst", package = "nonmem2R")
# 2) Compile summary information from "run001.lst"
sumoR(file1)




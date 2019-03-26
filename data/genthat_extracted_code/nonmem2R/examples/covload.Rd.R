library(nonmem2R)


### Name: covload
### Title: Load the covariance matrix from a nonmem .cov output file.
### Aliases: covload

### ** Examples

##### Load the .cov file "run001.cov"
# 1) Get path to the example file included in nonmem2R package
file1 <- system.file("extdata", "run001.cov", package = "nonmem2R")
# 2) Load the file using the covload function
covload(file1)




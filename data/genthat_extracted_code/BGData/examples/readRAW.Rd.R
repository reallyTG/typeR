library(BGData)


### Name: readRAW
### Title: Creates a BGData Object From a .raw File or a .ped-Like File.
### Aliases: readRAW readRAW_matrix readRAW_big.matrix

### ** Examples

# Path to example data
path <- system.file("extdata", package = "BGData")

# Convert RAW files of chromosome 1 to a BGData object
bg <- readRAW(fileIn = paste0(path, "/chr1.raw"))




library(eemR)


### Name: eem_export_matlab
### Title: Export EEMs to Matlab
### Aliases: eem_export_matlab

### ** Examples

file <- system.file("extdata/cary/", package = "eemR")
eem <- eem_read(file, recursive = TRUE)

export_to <- paste(tempfile(), ".mat", sep = "")
eem_export_matlab(export_to, eem)




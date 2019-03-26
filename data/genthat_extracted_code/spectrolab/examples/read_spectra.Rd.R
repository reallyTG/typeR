library(spectrolab)


### Name: read_spectra
### Title: Read files from various formats into 'spectra'
### Aliases: read_spectra

### ** Examples

library(spectrolab)
dir_path = system.file("extdata", "Acer_example", package = "spectrolab")
spec     = read_spectra(path = dir_path, format = "sig")




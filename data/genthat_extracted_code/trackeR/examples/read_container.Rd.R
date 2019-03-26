library(trackeR)


### Name: read_container
### Title: Read a GPS container file.
### Aliases: read_container readContainer

### ** Examples

filepath <- system.file("extdata/tcx", "2013-06-08-090442.TCX", package = "trackeR")
run <- read_container(filepath, type = "tcx", timezone = "GMT")




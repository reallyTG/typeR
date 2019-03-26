library(actogrammr)


### Name: bin_data
### Title: bin_data
### Aliases: bin_data

### ** Examples

f <- file.path(system.file(package = 'actogrammr'), 'testdata')
d <- read_clock_lab_files(file_names = list.files(path = f, full.names = TRUE))
b <- bin_data(data = d, minutes_per_bin = 6)




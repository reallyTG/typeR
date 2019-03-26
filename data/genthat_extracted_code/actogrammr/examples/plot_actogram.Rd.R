library(actogrammr)


### Name: plot_actogram
### Title: plot_actogram
### Aliases: plot_actogram

### ** Examples

f <- file.path(system.file(package = 'actogrammr'), 'testdata')
d <- read_clock_lab_files(file_names = list.files(path = f, full.names = TRUE))
b <- bin_data(data = d, minutes_per_bin = 6)
## Not run: 
##D plot_actogram(data = b, start_date = '2010-01-01')
## End(Not run)




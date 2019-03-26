library(GCalignR)


### Name: read_peak_list
### Title: Read content of a text file and convert it to a list
### Aliases: read_peak_list

### ** Examples

path <- system.file("extdata", "simulated_peak_data.txt", package = "GCalignR")
x <- read_peak_list(data = path, rt_col_name = "rt")





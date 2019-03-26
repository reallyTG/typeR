library(GCalignR)


### Name: remove_blanks
### Title: Remove peaks present in negative control samples
### Aliases: remove_blanks

### ** Examples

data("peak_data")
## subset for faster processing
data <- lapply(peak_data[1:5], function(x) x[20:35,])
x <- align_chromatograms(data, rt_col_name = "time")
out <- remove_blanks(data = x, blanks = c("C2","C3"))
## number of deleted peaks
nrow(x[["aligned_list"]][["M2"]]) - nrow(out[["M2"]])





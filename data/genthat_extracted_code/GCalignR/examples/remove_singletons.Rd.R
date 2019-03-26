library(GCalignR)


### Name: remove_singletons
### Title: Remove singletons
### Aliases: remove_singletons

### ** Examples

data("peak_data")
## subset for faster processing
data <- lapply(peak_data[1:5], function(x) x[20:35,])
x <- align_chromatograms(data, rt_col_name = "time")
out <- remove_singletons(data = x)





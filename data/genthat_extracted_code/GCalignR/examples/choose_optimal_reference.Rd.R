library(GCalignR)


### Name: choose_optimal_reference
### Title: Select the optimal reference for full alignments of peak lists
### Aliases: choose_optimal_reference

### ** Examples

## 1.) input is a list
## using a list of samples
data("peak_data")
## subset for faster processing
peak_data <- peak_data[1:3]
choose_optimal_reference(peak_data, rt_col_name = "time")





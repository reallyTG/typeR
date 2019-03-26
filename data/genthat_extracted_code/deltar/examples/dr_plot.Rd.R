library(deltar)


### Name: dr_plot
### Title: Plot Delta R values from an object produced by dr_df()
### Aliases: dr_plot

### ** Examples

# Acquire "BSea" data set
data(BSea)
# Compute Delta R values and store them in the new object
bsea_res <- dr_df(BSea, method = "shell")
# Plot Delta R values with "quantile" method
dr_plot(bsea_res, name = "BSea")
# Expand x-axis of the plot
dr_plot(bsea_res, name = "BSea", lim = c(150, 250))
# Plot Delta R values with "density" method
dr_plot(bsea_res, name = "BSea", method = "density")




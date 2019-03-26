library(Luminescence)


### Name: calc_FastRatio
### Title: Calculate the Fast Ratio for CW-OSL curves
### Aliases: calc_FastRatio

### ** Examples

# load example CW-OSL curve
data("ExampleData.CW_OSL_Curve")

# calculate the fast ratio w/o further adjustments
res <- calc_FastRatio(ExampleData.CW_OSL_Curve)

# show the summary table
get_RLum(res)





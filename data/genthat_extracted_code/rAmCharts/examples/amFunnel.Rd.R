library(rAmCharts)


### Name: amFunnel
### Title: Plotting funnel chart using rAmCharts
### Aliases: amFunnel

### ** Examples

data(data_funnel)
amFunnel(data = data_funnel, inverse = TRUE)

## No test: 
# Other examples available which can be time consuming depending on your configuration.

# Change the orientation and legend side              
amFunnel(data = data_funnel, inverse = FALSE,
         label_side = "left", margin_right = 15, margin_left = 160)

# Basic example : Funnel chart
amFunnel(data = data_funnel, neck_height = 30, neck_width = 40)

# 3D pyramid
amFunnel(data = data_funnel, depth = 50, inverse = TRUE)
## End(No test)







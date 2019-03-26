library(rAmCharts)


### Name: amPie
### Title: Plotting pie chart
### Aliases: amPie

### ** Examples

data("data_pie")
amPie(data = data_pie)

## No test: 
# Other examples available which can be time consuming depending on your configuration.

# Don't display values
amPie(data = data_pie, show_values = FALSE)

# 3D pie
amPie(data = data_pie, depth = 10)

# Donut chart
amPie(data = data_pie, inner_radius = 50)

# All parameters
amPie(data = data_pie, inner_radius = 50, depth = 10, show_values = FALSE)
## End(No test)




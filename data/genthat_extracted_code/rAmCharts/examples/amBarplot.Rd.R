library(rAmCharts)


### Name: amBarplot
### Title: Plotting bar chart using rAmCharts
### Aliases: amBarplot

### ** Examples

# Data
data(data_bar)
data(data_gbar)

amBarplot(x = "country", y = "visits", data = data_bar, main = "example")

## No test: 

# Other examples available which can be time consuming depending on your configuration.

# fixed value axis
amBarplot(x = "year", y = c("income", "expenses"), data = data_gbar, ylim = c(0, 26))
amBarplot(x = "year", y = c("income", "expenses"), data = data_gbar, stack_type = "100")

# Test with label rotation
amBarplot(x = "country", y = "visits", data = data_bar, labelRotation = -45) 

# Horizontal bar
amBarplot(x = "country", y = "visits", data = data_bar, horiz = TRUE, labelRotation = -45)

# 3D bar
amBarplot(x = "country", y = "visits", data = data_bar, depth = 15, labelRotation = -45)

# Display values
amBarplot(x = "country", y = "visits", data = data_bar, show_values = TRUE, labelRotation = -45)

# Grouped columns
amBarplot(x = "year", y = c("income", "expenses"), data = data_gbar)

# Parse dates
# Default label: first day of each year
amBarplot(x = "year", y = c("income", "expenses"), data = data_gbar,
          dataDateFormat = "YYYY", minPeriod = "YYYY")

# Default label: first day of each month
amBarplot(x = "month", y = c("income", "expenses"), data = data_gbar,
          dataDateFormat = "MM/YYYY", minPeriod = "MM")

amBarplot(x = "day", y = c("income", "expenses"), data = data_gbar,
          dataDateFormat = "DD/MM/YYYY")
          
# Change groups colors
amBarplot(x = "year", y = c("income", "expenses"), data = data_gbar, 
          groups_color = c("#87cefa", "#c7158"))

# Regular stacked bars
amBarplot(x = "year", y = c("income", "expenses"), data = data_gbar, stack_type = "regular")

# 100% stacked bars
amBarplot(x = "year", y = c("income", "expenses"), data = data_gbar, stack_type = "100")

# Layered bars
amBarplot(x = "year", y = c("income", "expenses"), data = data_gbar, layered = TRUE)

# Data with row names
dataset <- data.frame(get(x = "USArrests", pos = "package:datasets"))
amBarplot(y = c("Murder", "Assault", "UrbanPop", "Rape"), data = dataset, stack_type = "regular")

# Round values
amBarplot(x = "year", y = c("in", "ex"), data = data_gbar, precision = 0)
## End(No test)





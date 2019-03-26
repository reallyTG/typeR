library(rAmCharts)


### Name: amMekko
### Title: Plotting mekko chart (quali vs quali)
### Aliases: amMekko

### ** Examples

data(data_mekko)
amMekko(x = "var1", y = "var2", data = data_mekko)

## No test: 
# Other examples available which can be time consuming depending on your configuration.
library(pipeR)
 
# Horizontal
amMekko(x = "var1", y = "var2", data = data_mekko, horiz = TRUE)
 
# Display values
amMekko(x = "var1", y = "var2", data = data_mekko, show_values = TRUE)
## End(No test)






library(billboarder)


### Name: bb_line
### Title: Line property for a Billboard.js chart
### Aliases: bb_line

### ** Examples

# Set if null data point will be connected or not.
b <- billboarder() %>% 
  bb_linechart(data = c(1, 2, NA, 4, 5))
b
b %>%  bb_line(connectNull = TRUE)





library(ggExtra)


### Name: plotCount
### Title: Plot count data with ggplot2
### Aliases: plotCount

### ** Examples

plotCount(table(infert$education))
df <- data.frame("vehicle" = c("bicycle", "car", "unicycle", "Boeing747"),
                 "NumWheels" = c(2, 4, 1, 16))
plotCount(df) + removeGridX()




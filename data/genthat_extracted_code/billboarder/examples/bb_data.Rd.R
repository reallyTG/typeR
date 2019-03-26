library(billboarder)


### Name: bb_data
### Title: Add data to Billboard chart
### Aliases: bb_data

### ** Examples

billboarder() %>%
 bb_barchart(data = table(mtcars$cyl)) %>%
 bb_data(names = list(Freq = "Number of cylinders"), labels = TRUE)
 




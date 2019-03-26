library(zoocat)


### Name: aggregate_col
### Title: Aggregate 'zoocat' objects by column attributes
### Aliases: aggregate_col

### ** Examples

# This is the air quality example from package reshape2
names(airquality) <- tolower(names(airquality))
aqm <- melt(airquality, id = c("month", "day"), na.rm=TRUE) 
zc <- cast2zoocat(aqm, index.var = 'month', value.var = 'value', fun.aggregate = mean) 
aggregate_col(zc, by = 'variable', FUN = max)
aggregate_col(zc, by = 'variable', FUN = max, na.rm = TRUE)





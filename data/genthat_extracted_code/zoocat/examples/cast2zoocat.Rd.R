library(zoocat)


### Name: cast2zoocat
### Title: Cast a data frame to a 'zoocat' object
### Aliases: cast2zoocat

### ** Examples


df <- data.frame(year = rep(1991 : 1995, each = 24), month = rep(1 : 12, 10),
                 varname = rep(c('a', 'b'), each = 12), city = rep(1 : 3, each = 40),
                 value = 1 : 120)
cast2zoocat(df, index.var = 'year', value.var = 'value')
cast2zoocat(df, index.var = 'year', value.var = 'value', attr.var = 'varname')

## This is the air quality example from package reshape2
names(airquality) <- tolower(names(airquality))
aqm <- melt(airquality, id = c("month", "day"), na.rm=TRUE) 
head(aqm)
cast2zoocat(aqm, index.var = 'month', value.var = 'value', attr.var = 'variable')
cast2zoocat(aqm, index.var = 'month', value.var = 'value')






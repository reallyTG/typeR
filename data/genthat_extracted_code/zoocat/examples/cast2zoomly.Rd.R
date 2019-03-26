library(zoocat)


### Name: cast2zoomly
### Title: Cast a data frame to a 'zoomly' object
### Aliases: cast2zoomly

### ** Examples

df <- data.frame(year = rep(1991 : 1995, each = 24), month = rep(1 : 12, 10),
                 varname = rep(c('a', 'b'), each = 12), city = rep(1 : 3, each = 40),
                 value = 1 : 120)
cast2zoomly(df, index.var = 'year', value.var = 'value')





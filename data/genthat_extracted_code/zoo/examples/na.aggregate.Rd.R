library(zoo)


### Name: na.aggregate
### Title: Replace NA by Aggregation
### Aliases: na.aggregate na.aggregate.default
### Keywords: ts

### ** Examples

z <- zoo(c(1, NA, 3:9),
         c(as.Date("2010-01-01") + 0:2,
           as.Date("2010-02-01") + 0:2,
           as.Date("2011-01-01") + 0:2))
## overall mean
na.aggregate(z)
## group by months
na.aggregate(z, as.yearmon)
## group by calendar months
na.aggregate(z, months)
## group by years
na.aggregate(z, format, "%Y")




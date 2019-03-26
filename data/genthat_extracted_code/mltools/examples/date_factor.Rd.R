library(mltools)


### Name: date_factor
### Title: Date Factor
### Aliases: date_factor

### ** Examples

library(data.table)
dts <- as.Date(c("2014-1-1", "2015-1-15", "2015-6-1"))
date_factor(dts, type = "yearmonth")
date_factor(dts, type = "yearquarter")
date_factor(
  dateVec = dts, 
  type = "yearquarter", 
  minDate = as.Date("2015-1-1"), 
  maxDate = as.Date("2015-12-31")
)
date_factor(
  dateVec = as.Date(character(0)), 
  type = "yearmonth", 
  minDate = as.Date("2016-1-1"), 
  as.Date("2016-12-31")
)





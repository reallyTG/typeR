library(geometa)


### Name: GMLTimePeriod
### Title: GMLTimePeriod
### Aliases: GMLTimePeriod
### Keywords: ISO period time

### ** Examples

  start <- ISOdate(2000, 1, 12, 12, 59, 45)
  end <- ISOdate(2010, 8, 22, 13, 12, 43)
  md <- GMLTimePeriod$new(beginPosition = start, endPosition = end)
  xml <- md$encode()





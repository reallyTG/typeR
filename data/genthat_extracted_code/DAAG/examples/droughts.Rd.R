library(DAAG)


### Name: droughts
### Title: Periods Between Rain Events
### Aliases: droughts
### Keywords: datasets

### ** Examples

  boxplot(length ~ year, data=droughts)
  boxplot(log(length) ~ year, data=droughts)
  hist(droughts$length, main="Winnipeg Droughts", xlab="length (in days)")
  hist(log(droughts$length), main="Winnipeg Droughts", xlab="length (in days, log scale)")





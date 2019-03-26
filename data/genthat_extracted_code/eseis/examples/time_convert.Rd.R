library(eseis)


### Name: time_convert
### Title: Convert Julian Day to Date and vice versa
### Aliases: time_convert
### Keywords: eseis

### ** Examples


## convert Julian Day 18 to POSIXct
time_convert(input = 18, output = "POSIXct")

## convert Julian Day 18 to yyyy-mm-dd
time_convert(input = 18, output = "yyyy-mm-dd")

## convert yyyy-mm-dd to Julian Day
time_convert(input = "2016-01-18", output = "JD")

## convert a vector of Julian Days to yyyy-mm-dd
time_convert(input = 18:21, output = "yyyy-mm-dd")
                     




library(tsibble)


### Name: guess_frequency
### Title: Guess a time frequency from other index objects
### Aliases: guess_frequency

### ** Examples

guess_frequency(yearquarter(seq(2016, 2018, by = 1 / 4)))
guess_frequency(yearmonth(seq(2016, 2018, by = 1 / 12)))
guess_frequency(seq(as.Date("2017-01-01"), as.Date("2017-01-31"), by = 1))
guess_frequency(seq(
  as.POSIXct("2017-01-01 00:00"), as.POSIXct("2017-01-10 23:00"), 
  by = "1 hour"
))




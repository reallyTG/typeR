library(timelineS)


### Name: durCalc
### Title: Filter Dataset by Date Duration
### Aliases: durCalc

### ** Examples

### Filter people who lived longer than 85 years
durCalc(life_exp, start = "Birth", end = "Death", timeunit = "years", filterlength = 85)

### How old each person would be as of January 1, 2000 if they were alive
durCalc(life_exp, start = "Birth", end = as.Date("2000-1-1"), timeunit = "years")

### Use as unit-converter between two dates
durCalc(start = as.Date("2010-12-1"), end = as.Date("2015-4-26"), timeunit = "weeks")




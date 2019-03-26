library(precintcon)


### Name: app
### Title: Amount and Percentage of Precipitation
### Aliases: app

### ** Examples

##
# Loading the daily precipitation serie
data(daily) 

##
# Calculating amount and percentage of precipitation using different parameters

app(daily)

app(daily, percent = 20)

app(daily, percent = c(10, 15, 20, 25))



